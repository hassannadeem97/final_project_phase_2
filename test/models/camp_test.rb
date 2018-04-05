require 'test_helper'

class CampTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_many :camp_instructors
  should belong_to :location
  should belong_to :curriculum
  should validate_presence_of(:cost)
  should validate_presence_of(:curriculum_id)
  should validate_presence_of(:location_id)
  should validate_presence_of(:start_date)
  should validate_presence_of(:end_date)
  should validate_presence_of(:time_slot)
  should validate_uniqueness_of(:start_date).scoped_to(:location_id, :time_slot).on(:create)
  
  
end
