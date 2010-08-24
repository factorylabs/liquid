autoload :Date, 'date'

class DateTime < Date  # :nodoc:
  def to_liquid
    self
  end
end