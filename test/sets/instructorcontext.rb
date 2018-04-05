module Contexts
  module InstructorContext
  
      def create_instructor
        @ins1 = FactoryBot.create(:instructor, first_name: "hassan", last_name: "nadeem", email: "q@.cmu.edu", phone: "1234512345" )
        @ins2 = FactoryBot.create(:instructor, first_name: "Jassan", last_name: "Jadeem", email: "j@.cmu.edu", phone: "1234567890" )
        @ins3 = FactoryBot.create(:instructor, first_name: "Kassan", last_name: "Kadeem", email: "k@.cmu.edu", phone: "1234566789", active: false, bio: "ddd" )
      end
  
      def destroy_instructor
        @ins1.destroy
        @ins2.destroy
        @ins3.destroy
      end
  
end
end 