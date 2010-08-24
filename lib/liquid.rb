# Copyright (c) 2005 Tobias Luetke
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'liquid/extensions'
require 'liquid/module_ex'

module Liquid
  FilterSeparator             = /\|/
  ArgumentSeparator           = ','
  FilterArgumentSeparator     = ':'
  VariableAttributeSeparator  = '.'
  TagStart                    = /\{\%/
  TagEnd                      = /\%\}/
  VariableSignature           = /\(?[\w\-\.\[\]]\)?/
  VariableSegment             = /[\w\-]/
  VariableStart               = /\{\{/
  VariableEnd                 = /\}\}/
  VariableIncompleteEnd       = /\}\}?/
  QuotedString                = /"[^"]*"|'[^']*'/
  QuotedFragment              = /#{QuotedString}|(?:[^\s,\|'"]|#{QuotedString})+/
  StrictQuotedFragment        = /"[^"]+"|'[^']+'|[^\s,\|,\:,\,]+/
  FirstFilterArgument         = /#{FilterArgumentSeparator}(?:#{StrictQuotedFragment})/
  OtherFilterArgument         = /#{ArgumentSeparator}(?:#{StrictQuotedFragment})/
  SpacelessFilter             = /^(?:'[^']+'|"[^"]+"|[^'"])*#{FilterSeparator}(?:#{StrictQuotedFragment})(?:#{FirstFilterArgument}(?:#{OtherFilterArgument})*)?/
  Expression                  = /(?:#{QuotedFragment}(?:#{SpacelessFilter})*)/
  TagAttributes               = /(\w+)\s*\:\s*(#{QuotedFragment})/
  AnyStartingTag              = /\{\{|\{\%/
  PartialTemplateParser       = /#{TagStart}.*?#{TagEnd}|#{VariableStart}.*?#{VariableIncompleteEnd}/
  TemplateParser              = /(#{PartialTemplateParser}|#{AnyStartingTag})/
  VariableParser              = /\[[^\]]+\]|#{VariableSegment}+\??/
  LiteralShorthand            = /^(?:\{\{\{\s?)(.*?)(?:\s*\}\}\})$/
  CommentShorthand            = /^(?:\{\s?\#\s?)(.*?)(?:\s*\#\s?\})$/

  # Internal Liquid classes
  autoload :BlockBehavior,    'lib/liquid/block_behavior'
  autoload :Document,         'lib/liquid/document'
  autoload :Tag,              'lib/liquid/tag'
  autoload :Drop,             'lib/liquid/drop'
  autoload :Strainer,         'lib/liquid/strainer'
  autoload :Context,          'lib/liquid/context'
  autoload :Variable,         'lib/liquid/variable'
  autoload :FileSystem,       'lib/liquid/file_system'
  autoload :Template,         'lib/liquid/template'
  autoload :StandardFilters,  'lib/liquid/standardfilters'
  autoload :Condition,        'lib/liquid/condition'

  # Liquid Errors
  class LiquidError < ::StandardError #:nodoc:
  end
  class ArgumentError < LiquidError #:nodoc:
  end
  class ContextError < LiquidError #:nodoc:
  end
  class FilterNotFound < LiquidError #:nodoc:
  end
  class FileSystemError < LiquidError #:nodoc:
  end
  class StandardError < LiquidError #:nodoc:
  end
  class SyntaxError < LiquidError #:nodoc:
  end
  class StackLevelError < LiquidError #:nodoc:
  end
end
