require 'test_helper'

class CommentTagTest < Test::Unit::TestCase
  include Liquid

  def test_has_a_block_which_does_nothing
    assert_template_result(%|the comment block should be removed  .. right?|,
                           %|the comment block should be removed {%comment%} be gone.. {%endcomment%} .. right?|)

    assert_template_result('','{%comment%}{%endcomment%}')
    assert_template_result('','{%comment%}{% endcomment %}')
    assert_template_result('','{% comment %}{%endcomment%}')
    assert_template_result('','{% comment %}{% endcomment %}')
    assert_template_result('','{%comment%}comment{%endcomment%}')
    assert_template_result('','{% comment %}comment{% endcomment %}')

    assert_template_result('foobar','foo{%comment%}comment{%endcomment%}bar')
    assert_template_result('foobar','foo{% comment %}comment{% endcomment %}bar')
    assert_template_result('foobar','foo{%comment%} comment {%endcomment%}bar')
    assert_template_result('foobar','foo{% comment %} comment {% endcomment %}bar')

    assert_template_result('foo  bar','foo {%comment%} {%endcomment%} bar')
    assert_template_result('foo  bar','foo {%comment%}comment{%endcomment%} bar')
    assert_template_result('foo  bar','foo {%comment%} comment {%endcomment%} bar')

    assert_template_result('foobar','foo{%comment%}
                                   {%endcomment%}bar')
  end

  def test_comment_shorthand_syntax
    ['{# fire za missiles! #}', '{ #comment# }', '{ # comment # }'].each { |t| assert_template_result('', t) }
  end

  # Class methods
  def test_from_shorthand
    assert_equal "{% comment %}{{{ {% if '1' == '1'}y{% endif %} }}}{% endcomment %}",
    Liquid::Tag::Comment.from_shorthand("{# {{{ {% if '1' == '1'}y{% endif %} }}} #}")
  end

end # CommentTagTest
