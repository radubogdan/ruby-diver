require 'test/unit'
require 'diver'

class DiverTest < Test::Unit::TestCase
  def setup
    @short_test = {'a' => {'b' => {'c' => 'd'}}}
    @empty = {}
  end

  # Simple tests for dive function
  def test_respond_to_dive_function
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

  # Simple tests for diveSet function
  def test_respond_to_diveSet_function
    assert_respond_to(@empty, :diveSet)
  end

  def test_expect_something_when_string_is_given
    assert_not_nil(@empty.diveSet('a'))
  end

  def test_expect_empty_hash
    assert_equal(@empty, @empty.diveSet(''))
    assert_equal({}, @empty.diveSet('a'))
  end

  def test_expect_simple_hash
    @empty.diveSet('a', 'b')
    assert_equal({'a' => 'b'}, @empty)
  end

  def test_expect_nested_hash
    @empty.diveSet('a','b','c')
    assert_equal({'a' => {'b' => 'c'}}, @empty)
  end

  def test_expect_big_nested_hash
    @empty.diveSet('a', 'b', 'c', 'd', 'e', 'f', 'g')
    assert_equal({'a' => {'b' => {'c' => {'d' => {'e' => {'f' => 'g'}}}}}}, @empty)
  end
end
