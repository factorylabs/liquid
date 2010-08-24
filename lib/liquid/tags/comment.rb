module Liquid

  class Comment < Block

    # Class methods
    def self.from_shorthand(source)
      source =~ CommentShorthand ? "{% comment %}#{$1}{% endcomment %}" : source
    end

    # Public methods

    def render(context)
      ''
    end

  end # Comment

  Template.register_tag('comment', Comment)

end # Liquid
