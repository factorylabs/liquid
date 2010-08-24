module Liquid

  module FileSystem

    # This implements an abstract file system which retrieves template files named in a manner
    # similar to Rails partials, ie. with the template name prefixed with an underscore.
    # The extension ".liquid" is also added.
    #
    # For security reasons, template paths are only allowed to contain letters, numbers, and underscore.
    #
    # Example:
    #
    # file_system = Liquid::LocalFileSystem.new("/some/path")
    #
    # file_system.full_path("mypartial")       # => "/some/path/_mypartial.liquid"
    # file_system.full_path("dir/mypartial")   # => "/some/path/dir/_mypartial.liquid"
    class Local < Base
      attr_accessor :root

      def initialize(root)
        @root = root
      end

      def read_template_file(template_path)
        full_path = full_path(template_path)

        raise FileSystemError, "No such template '#{template_path}'" unless File.exists?(full_path)

        File.read(full_path)
      end

      private

        def full_path(template_path) # :nodoc:
          raise FileSystemError,
            "Illegal template name '#{template_path}'" unless template_path =~ /^[^.\/][a-zA-Z0-9_\/]+$/

          full_path = if template_path.include?('/')
            File.join(root, File.dirname(template_path), "_#{File.basename(template_path)}.liquid")
          else
            File.join(root, "_#{template_path}.liquid")
          end

          unless File.expand_path(full_path) =~ /^#{File.expand_path(root)}/
            raise FileSystemError, "Illegal template path '#{File.expand_path(full_path)}'"
          end

          full_path
        end
    end

  end # FileSystem

end # Liquid
