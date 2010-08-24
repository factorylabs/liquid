module Liquid

  module FileSystem

    # A Liquid file system is way to let your templates retrieve other templates for use with the include tag.
    #
    # You can implement subclasses that retrieve templates from the database, from the file system using a different
    # path structure, you can provide them as hard-coded inline strings, or any manner that you see fit.
    #
    # You can add additional instance variables, arguments, or methods as needed.
    #
    # Example:
    #
    # Liquid::Template.file_system = Liquid::LocalFileSystem.new(template_path)
    # liquid = Liquid::Template.parse(template)
    #
    # This will parse the template with a LocalFileSystem implementation rooted at 'template_path'.
    class Blank < Base
      # Called by Liquid to retrieve a template file
      def read_template_file(template_path)
        raise FileSystemError, "This liquid context does not allow includes."
      end
    end

  end # FileSystem

end # Liquid

# Backwards compatible constants
Liquid::BlankFileSystem = Liquid::FileSystem::Blank