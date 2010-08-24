module Liquid

  module Filters

    autoload :StandardFilters, 'lib/liquid/filters/standard_filters'

    # Register StandardFilters within Liquid::Template
    Liquid::Template.register_filter(Liquid::Filters::StandardFilters)

  end # Filters

end # Liquid
