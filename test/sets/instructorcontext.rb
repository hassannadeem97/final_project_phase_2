module Contexts
  module InstructorContext
  
      def create_instructor
        @ins1 = FactoryBot.create(:instructor, first_name: "hassan", last_name: "nadeem", email: "q@.cmu.edu", phone: "1234512345" )
        @ins2 = FactoryBot.create(:instructor, first_name: "Jassan", last_name: "Jadeem", email: "j@.cmu.edu", phone: "1234567890" )
        @ins3 = FactoryBot.create(:instructor, first_name: "Kassan", last_name: "Kadeem", email: "k@.cmu.edu", phone: "1234566789", active: false, bio: "ddd" )
        @l1 = FactoryBot.create(:location, name: "ghanim", street_1:"al-taei", zip: "12345", max_capacity: 200)
        @is = FactoryBot.create(:curriculum, name: "IS", min_rating: 125, max_rating: 2900 )
        @cam1 = FactoryBot.create(:camp, curriculum: @is, location: @l1, cost: 1000.5, start_date: Date.new(2018,4,9), end_date: Date.new(2018,4,10), time_slot: "am", max_students:100 )
        
      end
  
      def destroy_instructor
        @ins1.destroy
        @ins2.destroy
        @ins3.destroy
        @l1.destroy
        @is.destroy
        @cam1.destroy
      end
  
  end
end 