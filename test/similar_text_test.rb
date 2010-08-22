require 'test/unit'
require File.dirname(__FILE__) + '/../lib/similar_text'

class SimilarTextTest < Test::Unit::TestCase
  include JoeHartman::SimilarText::ClassMethods

  def test_similar_text
    a = similar_text( "yahoo", "yhoo" )
    assert_equal( a[:matched_chars], 4 )
    assert_in_delta( 0.8, a[:confidence], 0.1 )
  end
end
