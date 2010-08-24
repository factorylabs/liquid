module Liquid

  module Tag

    class Comment
      include Liquid::BlockBehavior

      # Class methods
      def self.from_shorthand(source)
        source =~ CommentShorthand ? "{% comment %}#{$1}{% endcomment %}" : source
      end

      # Public methods
      def render(context)
        ''
      end

    end # Comment

  end # Tag

end # Liquid
