require 'minitest/autorun'

class MoviesControllerTest < Minitest::Unit::TestCase
  def setup
    # Do nothing
    @movie_controller = MoviesController.new
  end

  def teardown
    # Do nothing
  end

  def test_test
    #skip 'Not implemented'
    assert_equal(1,1,"ok")
  end

  def test_index
    get :index
    assert 200, @movie_controller.res
  end

end