require 'test/unit'
require 'diver'

class DiverTest < Test::Unit::TestCase
  def setup
    @short_test = {'a' => {'b' => {'c' => 'd'}}}
  end

  def test_respond_to_main_function
    assert_respond_to(@short_test, :dive)
  end

  def test_expect_a_result_when_key_exist
    assert_not_nil(@short_test.dive('a'))
  end

  def test_expect_nil_as_result_when_key_doesnt_exist
    assert_nil(@short_test.dive('x'))
  end

  def test_should_equal_semantic
    assert_equal(@short_test['a']['b']['c'], @short_test.dive('a', 'b', 'c'))
  end

  def test_should_equal_hash
    assert_equal({'b' => {'c' => 'd'}}, @short_test.dive('a'))
    assert_equal({'c' => 'd'}, @short_test.dive('a', 'b'))
  end

  def test_should_equal_value
    assert_equal('d', @short_test.dive('a', 'b', 'c'))
  end
end
