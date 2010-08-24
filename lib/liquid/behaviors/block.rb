module Liquid

  module Behavior

    # Liquid makes available the shared Liquid::Behavior::Block in order to use it in several of its core pieces.
    # Most notably, Block is at the hart of some of the most used Liquid::Tag, namely Liquid::Tag::If
    #
    # Example
    #   class Tag
    #     include Liquid::Behavior::Block
    #   end
    #
    #   Tag.new('mytag', '', '').block_delimiter #=> 'endmytag'
    module Block

      # Constants
      IsTag             = /^#{TagStart}/
      IsVariable        = /^#{VariableStart}/
      FullToken         = /^#{TagStart}\s*(\w+)\s*(.*)?#{TagEnd}$/
      ContentOfVariable = /^#{VariableStart}(.*)#{VariableEnd}$/

      # Accessors
      attr_accessor :nodelist

      # Constructor
      def initialize(tag_name, markup, tokens)
        @tag_name   = tag_name
        @markup     = markup
        parse(tokens)
      end

      # Public Accessor Methods

      # Returns the name of the current class in downcase.
      #
      # Example:
      #   Liquid::Tag::Literal.new('literal', '', ['hello world', '{% endliteral% }']).name #=> "liquid::tag::literal"
      def name
        self.class.name.downcase
      end

      # Returns the name of the block.
      #
      # Example:
      #   literal = Liquid::Tag::Literal.new('literal', '', ['hello world', '{% endliteral% }'])
      #   literal.block_name #=> "literal"
      def block_name
        @tag_name
      end

      # Returns the block delimiter of the current block.
      #
      # Example:
      #   literal = Liquid::Tag::Literal.new('literal', '', ['hello world', '{% endliteral% }'])
      #   literal.block_delimiter #=> "endliteral"
      def block_delimiter
        "end#{block_name}"
      end

      # Public methods

      # Parse the token list
      def parse(tokens)
        @nodelist ||= []
        @nodelist.clear

        while token = tokens.shift

          case token
          when IsTag
            if token =~ FullToken

              # if we found the proper block delimitor just end parsing here and let the outer block
              # proceed
              if block_delimiter == $1
                end_tag
                return
              end

              # fetch the tag from registered blocks
              if tag = Template.tags[$1]
                @nodelist << tag.new($1, $2, tokens)
              else
                # this tag is not registered with the system
                # pass it to the current block for special handling or error reporting
                unknown_tag($1, $2, tokens)
              end
            else
              raise SyntaxError, "Tag '#{token}' was not properly terminated with regexp: #{TagEnd.inspect} "
            end
          when IsVariable
            @nodelist << create_variable(token)
          when ''
            # pass
          else
            @nodelist << token
          end
        end

        # Make sure that its ok to end parsing in the current block.
        # Effectively this method will throw and exception unless the current block is
        # of type Document
        assert_missing_delimitation!
      end

      def end_tag
      end

      def unknown_tag(tag, params, tokens)
        case tag
        when 'else'
          raise SyntaxError, "#{block_name} tag does not expect else tag"
        when 'end'
          raise SyntaxError, "'end' is not a valid delimiter for #{block_name} tags. use #{block_delimiter}"
        else
          raise SyntaxError, "Unknown tag '#{tag}'"
        end
      end

      def create_variable(token)
        token.scan(ContentOfVariable) do |content|
          return Variable.new(content.first)
        end
        raise SyntaxError.new("Variable '#{token}' was not properly terminated with regexp: #{VariableEnd.inspect} ")
      end

      def render(context)
        render_all(@nodelist, context)
      end

      protected

        def assert_missing_delimitation!
          raise SyntaxError.new("#{block_name} tag was never closed")
        end

        def render_all(list, context)
          list.collect do |token|
            begin
              token.respond_to?(:render) ? token.render(context) : token
            rescue Exception => e
              context.handle_error(e)
            end
          end
        end

    end # Block

  end # Behaviors

end # Liquid
