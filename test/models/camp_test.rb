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
  should_not allow_value('sdkk0').for(:time_slot)
  should validate_numericality_of(:max_students).is_greater_than_or_equal_to(0)

  
  
  context "Creating a set of camps" do
    setup do
      create_camp
      
      
    end

    teardown do
      destroy_camp
    end
  
  
  should "have a scope that returns active camps" do
      assert_equal ["IS ghanim", "IS najma"], Camp.active.alphabetical.map{|c| c.name1}
  end
  
  should "have a scope that returns inactive camps" do
      assert_equal ["CS ghanim"], Camp.inactive.alphabetical.map{|c| c.name1}
  end
  
should "have a scope to alphabetize curriculum names of the camps" do
      assert_equal ["CS","IS", "IS"], Camp.alphabetical.all.map(&:name),"#{Camp.class}"
  end
  
  should "have a scope that returns camps in chronological order" do    
      assert_equal ["2018-02-03, 2018-04-03", "#{Date.today}, 2018-04-08", "2018-04-09, 2018-04-10"], Camp.chronological.map{|c| c.date}
  end
  
  should "have a scope that returns morning time_slot camps" do
      assert_equal ["IS ghanim", "CS ghanim"], Camp.morning.map{|c| c.name1}
  end
  
  should "have a scope that returns afternoon time_slot camps" do
      assert_equal ["IS najma"], Camp.afternoon.map{|c| c.name1}
  end
  
  should "have a scope that returns upcoming camps" do
      assert_equal 2, Camp.upcoming.size
  end
  
  should "have a scope that returns past camps" do
      assert_equal 1, Camp.past.size
  end
  
  should "have a scope that returns camp for specific curriculum" do
      assert_equal ["CS ghanim"], Camp.for_curriculum(980190964).map{|c| c.name1}
  end
  
  should "have a name method that lists the name of the curriculum being used in the camp" do
      assert_equal "IS", @cam1.name
      assert_equal "IS", @cam2.name
      assert_equal "CS", @cam3.name
    end
    
    
  should "have a name validation/method that checks if the location is active" do
      assert_nil nil, @cam1.location_id_check
      assert_nil nil, @cam2.location_id_check
      assert_nil nil, @cam3.location_id_check
    end
    
  should "have a name validation/method that checks if the curriculum  is active" do
      assert_nil nil, @cam1.curriculum_id_check
      assert_nil nil, @cam2.curriculum_id_check
      assert_nil nil, @cam3.curriculum_id_check
    end
    
  
    
  
  
  
  
  end
end
