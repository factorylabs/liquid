module Liquid

  module Tag

    # Assign sets a variable in your template.
    #
    #   {% assign foo = 'monkey' %}
    #
    # You can then use the variable later in the page.
    #
    #  {{ foo }}
    #
    class Assign < Base

      Syntax = /(#{VariableSignature}+)\s*=\s*(#{QuotedFragment}+)/

      def initialize(tag_name, markup, tokens)
        if markup =~ Syntax
          @to = $1
          @from = $2
        else
          raise SyntaxError.new("Syntax Error in 'assign' - Valid syntax: assign [var] = [source]")
        end

        super
      end

      def render(context)
        context.scopes.last[@to] = context[@from]
        ''
      end

    end # Assign

  end # Tag

end # Liquid