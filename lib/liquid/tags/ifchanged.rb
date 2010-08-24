module Liquid

  module Tag

    class Ifchanged
      include Liquid::BlockBehavior

      def render(context)

        context.stack do

          output = render_all(@nodelist, context)

          if output != context.registers[:ifchanged]
            context.registers[:ifchanged] = output
            output
          else
            ''
          end
        end # context.stack

      end # render

    end # Ifchanged

  end # Tag

end # Liquid