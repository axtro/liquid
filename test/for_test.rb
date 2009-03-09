require File.dirname(__FILE__) + '/helper'

class ForTest < Test::Unit::TestCase
  include Liquid

  def test_chunks
    assert_template_result()
  end
end