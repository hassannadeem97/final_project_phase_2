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
  should allow_value('1234567890').for(:phone)
  
context "Creating a set of instructor" do
    setup do
      create_instructor
    end

    teardown do
      # destroy_instructor 
    end
  
  
  should "have name methods that list first_ and last_names combined" do
      assert_equal "hassan nadeem", @ins1.proper_name
      assert_equal "Jassan Jadeem", @ins2.proper_name
      assert_equal "Kassan Kadeem", @ins3.proper_name
    end
    
    should "have name methods that list last_name,first_name combined" do
      assert_equal "nadeem,hassan", @ins1.name
      assert_equal "Jadeem,Jassan", @ins2.name
      assert_equal "Kadeem,Kassan", @ins3.name
    end
  
  
  should "have a scope that returns active Instructors" do
      assert_equal ["Jassan", "hassan"], Instructor.active.alphabetical.all.map{|c| c.first_name}
  end
  
  # should "have a scope to alphabetize Instructor" do
  #     assert_equal ["Alex", "Mark", "Rachel"], Instructor.alphabetical.map{|c| c.first_name}
  # end
  
  should "have a scope that returns inactive Instructors" do
      assert_equal ["Kassan"], Instructor.inactive.alphabetical.map{|c| c.first_name}
  end
  
  should "have a scope that returns Instructors that don't have a bio" do
      assert_equal ["Jassan", "hassan"], Instructor.alphabetical.map{|c| c.first_name if c.bio == nil }.reject(&:nil?)
    end
    
    

  
end
end 

