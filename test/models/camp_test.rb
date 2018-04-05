require 'test_helper'

class CampTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_many :camp_instructors
  should belong_to :curriculum
  
  should belong_to :location
  should validate_uniqueness_of(:start_date).scoped_to(:location_id, :time_slot).on(:create)
  
  should validate_presence_of(:cost)
  should validate_presence_of(:curriculum_id)
  should validate_presence_of(:location_id)
  should validate_presence_of(:start_date)
  should validate_presence_of(:end_date)
  should validate_presence_of(:time_slot)
  should allow_value('am').for(:time_slot)
  should allow_value('pm').for(:time_slot)
  
  
  context "Creating a set of curriculum" do
    setup do
      create_camp
    end

    teardown do
      destroy_camp
    end
  
  
  # should "have a scope to alphabetize curriculum names" do
  #     assert_equal ["BA","CS","IS"], Curriculum.alphabetical.all.map(&:name),"#{Curriculum.class}"
  # end
  
  
  
  # should "have a scope that returns active curriculums" do
  #     assert_equal ["CS", "IS"], Curriculum.active.alphabetical.map{|c| c.name}
  # end
  
  # should "have a scope that returns inactive curriculums" do
  #     assert_equal ["BA"], Curriculum.inactive.alphabetical.map{|c| c.name}
  # end
  
  # should "have a scope for checking rating" do
  #     assert_equal 3, Curriculum.for_rating(1000).size
  # end
  
  
  
  
  
  
  end
end
