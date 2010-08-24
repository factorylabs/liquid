module Liquid

  module FileSystem

    # Liquid::FileSystem::Base is effectively an abstract Liquid::FileSystem that is not to be used on its own.
    # Instead, this class is to be inherited by Liquid::FileSystem implementations such as:
    #
    #   * Liquid::FileSystem::Blank
    #   * Liquid::FileSystem::Local
    class Base

      # Method called whenever a template file needs to be read.
      def read_template_file(template_path)
        raise NotImplementedError, 'Please inherit this class and implement this method.'
      end

    end

  end # FileSystem

end # Liquid
