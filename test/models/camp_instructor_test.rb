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
  
end
