require 'test_helper'

class CurriculumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_many(:camps)
  should validate_presence_of(:name)
  should validate_presence_of(:min_rating)
  should validate_presence_of(:max_rating)
  should validate_uniqueness_of(:name).case_insensitive
  should validate_numericality_of(:min_rating).is_greater_than_or_equal_to(0)
  should validate_numericality_of(:max_rating).is_less_than_or_equal_to(3000)
  
  context "Creating a set of curriculum" do
    setup do
      create_curriculum
    end

    teardown do
      destroy_curriculum
    end
  
  
  should "have a scope to alphabetize curriculum names" do
      assert_equal ["BA","CS","IS"], Curriculum.alphabetical.all.map(&:name),"#{Curriculum.class}"
  end
  
  
  
  should "have a scope that returns active curriculums" do
      assert_equal ["CS", "IS"], Curriculum.active.alphabetical.map{|c| c.name}
  end
  
  should "have a scope that returns inactive curriculums" do
      assert_equal ["BA"], Curriculum.inactive.alphabetical.map{|c| c.name}
  end
  
  should "have a scope for checking rating" do
      assert_equal 3, Curriculum.for_rating(1000).size
  end
  
  
  end
end
