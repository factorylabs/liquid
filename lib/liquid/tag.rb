module Liquid

  module Tag

    # All tags are Liquid::Tag::Base
    autoload :Base,       'lib/liquid/tags/base'

    autoload :Assign,     'lib/liquid/tags/assign'
    autoload :Cycle,      'lib/liquid/tags/cycle'
    autoload :Include,    'lib/liquid/tags/include'
    autoload :Capture,    'lib/liquid/tags/capture'
    autoload :Case,       'lib/liquid/tags/case'
    autoload :Comment,    'lib/liquid/tags/comment'
    autoload :For,        'lib/liquid/tags/for'
    autoload :TableRow,   'lib/liquid/tags/table_row'
    autoload :If,         'lib/liquid/tags/if'
    autoload :Unless,     'lib/liquid/tags/unless'
    autoload :Ifchanged,  'lib/liquid/tags/ifchanged'
    autoload :Literal,    'lib/liquid/tags/literal'
  end # Tag

end # Liquid
