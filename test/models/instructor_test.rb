require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should have_many(:camp_instructors)
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email)
  should validate_length_of(:phone).is_at_most(10)
  
context "Creating a set of instructor" do
    setup do
      create_instructor
    end

    teardown do
      # destroy_instructor 
    end
  
  
  # should "have a scope to alphabetize instructor names first lastname and then firstname" do
  #     assert_equal ["ghanim","muglina", "najma"], Instructor.alphabetical.map{|c,d| c.first_name, d.last_name}
  # end
  
  
  should "have a scope that returns active Instructors" do
      assert_equal ["ghanim", "najma"], Instructor.active.alphabetical.all.map{|c| c.first_name}
  end
  
  # should "have a scope that returns inactive curriculums" do
  #     assert_equal ["muglina"], Location.inactive.alphabetical.map{|c| c.name}
  # end
  
end


end 

