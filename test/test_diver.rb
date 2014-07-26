require 'test/unit'
require 'diver'

class DiverTest < Test::Unit::TestCase
  def setup
    @short_test = {'a' => {'b' => {'c' => 'd'}}}
  end

  def test_repond_to_main_function
    assert_respond_to(@short_test, :dive)
  end

  def test_expect_a_result_when_key_exist
    assert_not_nil
      Diver::Diver.dive(@short_test, 'a')
  end

  def test_expect_nil_as_result_when_key_doesnt_exist
    assert_nil
      Diver::Diver.dive(@short_test, 'x')
  end

  def test_should_equal_semantic
    assert_equal @short_test['a']['b']['c']
      Diver::Diver.dive(@short_test, 'a', 'b', 'c')
  end

  def test_should_equal_hash
    assert_equal "{'b' => {'c' => 'd'}}"
      Diver::Diver.dive(@short_test, 'a')
  end

  def test_should_equal_hash_test_two
    assert_equal "{'c' => 'd'}"
      Diver::Diver.dive(@short_test, 'a', 'b')
  end

  def test_should_equal_value
    assert_equal 'd'
      Diver::Diver.dive(@short_test, 'a', 'b', 'c')
  end
end
