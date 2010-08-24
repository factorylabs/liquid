module Liquid

  module FileSystem

    autoload :Base,  'lib/liquid/file_systems/base'
    autoload :Blank, 'lib/liquid/file_systems/blank'
    autoload :Local, 'lib/liquid/file_systems/local'

  end # FileSystem

end # Liquid
