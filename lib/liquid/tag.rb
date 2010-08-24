module Liquid

  module Tag

    autoload :Base,       'lib/liquid/tags/base'

    # Extend Base
    autoload :Assign,     'lib/liquid/tags/assign'
    autoload :Block,      'lib/liquid/tags/block'
    autoload :Cycle,      'lib/liquid/tags/cycle'
    autoload :Include,    'lib/liquid/tags/include'

    # Extend Block
    autoload :Capture,    'lib/liquid/tags/capture'
    autoload :Case,       'lib/liquid/tags/case'
    autoload :Comment,    'lib/liquid/tags/comment'
    autoload :Document,   'lib/liquid/tags/document'
    autoload :For,        'lib/liquid/tags/for'
    autoload :TableRow,   'lib/liquid/tags/table_row'
    autoload :If,         'lib/liquid/tags/if'
    autoload :Unless,     'lib/liquid/tags/unless'
    autoload :Ifchanged,  'lib/liquid/tags/ifchanged'
    autoload :Literal,    'lib/liquid/tags/literal'

    # Register Liquid base tags
    Template.register_tags({ :assign     => Liquid::Tag::Assign,
                             :capture    => Liquid::Tag::Capture,
                             :case       => Liquid::Tag::Case,
                             :comment    => Liquid::Tag::Comment,
                             :cycle      => Liquid::Tag::Cycle,
                             :for        => Liquid::Tag::For,
                             :if         => Liquid::Tag::If,
                             :ifchanged  => Liquid::Tag::Ifchanged,
                             :include    => Liquid::Tag::Include,
                             :literal    => Liquid::Tag::Literal,
                             :tablerow   => Liquid::Tag::TableRow,
                             :unless     => Liquid::Tag::Unless })
  end # Tag

end # Liquid
