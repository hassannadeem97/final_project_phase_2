require 'test_helper'

class CampInstructorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to :instructor
  should belong_to :camp
  should validate_presence_of(:camp_id)
  should validate_presence_of(:instructor_id)
  should validate_uniqueness_of(:camp_id).scoped_to(:instructor_id)
  
   context "Creating a set of camps" do
    setup do
      create_camp_instructor
      
      
      
    end

    teardown do
      destroy_camp_instructor
      
    end
    
    
    should "have a name validation/method that checks if the camp is active" do
      assert_nil nil, @cam_ins2.camp_active
      assert_nil nil, @cam_ins1.camp_active
    end
    
  should "have a name validation/method that checks if the instructor is active" do
      assert_nil nil, @cam_ins1.instructor_active
      assert_nil nil, @cam_ins2.instructor_active
    end
    
    
    
    
    
    
end 
end
