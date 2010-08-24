module Liquid

  module Tag

    # Capture stores the result of a block into a variable without rendering it inplace.
    #
    #   {% capture heading %}
    #     Monkeys!
    #   {% endcapture %}
    #   ...
    #   <h1>{{ heading }}</h1>
    #
    # Capture is useful for saving content for use later in your template, such as
    # in a sidebar or footer.
    #
    class Capture
      include Liquid::BlockBehavior

      Syntax = /(\w+)/

      def initialize(tag_name, markup, tokens)
        if markup =~ Syntax
          @to = $1
        else
          raise SyntaxError.new("Syntax Error in 'capture' - Valid syntax: capture [var]")
        end

        super
      end

      def render(context)
        output = super
        context.scopes.last[@to] = output.join
        ''
      end

    end # Capture

  end # Tag

end # Liquid