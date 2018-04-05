require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should validate_presence_of(:max_capacity)
  should validate_numericality_of(:max_capacity).is_greater_than_or_equal_to(0)
  should validate_presence_of(:street_1)
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).case_insensitive
  should validate_presence_of(:zip)
  should validate_length_of(:zip).is_equal_to(5)
  should allow_value('12345').for(:zip)
  
  context "Creating a set of location" do
    setup do
      create_location
    end

    teardown do
      destroy_location
    end
  
  
  should "have a scope to alphabetize location names" do
      assert_equal ["ghanim","muglina", "najma"], Location.alphabetical.all.map(&:name),"#{Location.class}"
  end
  
  
  should "have a scope that returns active curriculums" do
      assert_equal ["ghanim", "najma"], Location.active.alphabetical.map{|c| c.name}
  end
  
  should "have a scope that returns inactive curriculums" do
      assert_equal ["muglina"], Location.inactive.alphabetical.map{|c| c.name}
  end
  
end
end 
