module Liquid

    class Document
      include Liquid::BlockBehavior

      # we don't need markup to open this block
      def initialize(tokens)
        parse(tokens)
      end

      # There isn't a real delimter
      def block_delimiter
        []
      end

      # Document blocks don't need to be terminated since they are not actually opened
      def assert_missing_delimitation!
      end
    end # Document

end # Liquid
