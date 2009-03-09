require File.dirname(__FILE__) + '/helper'

class ForTest < Test::Unit::TestCase
  include Liquid

  def test_for_with_chunks
    assert_template_result('Row 1: 123 Row 2: 45 Row 3: 67 ', '{% for chunk in b chunks:3 %}Row {{forloop.index}}: {% for a in chunk %}{{a}}{% endfor %} {% endfor %}', 'b' => [1,2,3,4,5,6,7])
  end
  
  def test_for_with_chunks_and_reversed
    assert_template_result('Row 1: 765 Row 2: 43 Row 3: 21 ', '{% for chunk in b reversed chunks:3 %}Row {{forloop.index}}: {% for a in chunk %}{{a}}{% endfor %} {% endfor %}', 'b' => [1,2,3,4,5,6,7])
  end
  
  def test_for_with_chunks_and_empty_collection
    assert_template_result('', '{% for chunk in b chunks:3 %}Row {{forloop.index}}: {% for a in chunk %}{{a}}{% endfor %} {% endfor %}', 'b' => [])
  end
  
  def test_for_with_chunks_and_limit_and_offset
    assert_template_result('Row 1: 45 Row 2: 6 ', '{% for chunk in b chunks:2 limit:3 offset:3 %}Row {{forloop.index}}: {% for a in chunk %}{{a}}{% endfor %} {% endfor %}', 'b' => [1,2,3,4,5,6,7])
  end
  
  def test_for_with_chunks_and_too_high_offset
    assert_template_result('', '{% for chunk in b chunks:2 offset:8 %}Row {{forloop.index}}: {% for a in chunk %}{{a}}{% endfor %} {% endfor %}', 'b' => [1,2,3,4,5,6,7])
  end
end