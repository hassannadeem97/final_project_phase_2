require 'date'
module Contexts
  module CampContext
  
      def create_camp
        @l1 = FactoryBot.create(:location, name: "ghanim", street_1:"al-taei", zip: "12345", max_capacity: 200)
        @l2 = FactoryBot.create(:location, name: "najma", street_1:"cltaei", zip: "12346", max_capacity: 100)
        @is = FactoryBot.create(:curriculum, name: "IS", min_rating: 125, max_rating: 2900 )
        @cs = FactoryBot.create(:curriculum, name: "CS", min_rating: 122, max_rating: 1900 )
        
        @cam1 = FactoryBot.create(:camp, curriculum: @is, location: @l1, cost: 1000.5, start_date: Date.new(2018,4,9), end_date: Date.new(2018,4,10), time_slot: "am", max_students:100 )
        @cam2 = FactoryBot.create(:camp, curriculum: @is, location: @l2, cost: 1010.5, start_date: Date.today, end_date: Date.new(2018,4,8), time_slot: "pm", max_students:80 )
        @cam3 = FactoryBot.create(:camp, curriculum: @cs, location: @l1, cost: 2000.5, start_date: Date.new(2018,2,3), end_date: Date.new(2018,4,3), time_slot: "am", max_students:40, active: false )
      end
  
      def destroy_camp
        
        @cam1.destroy
        @cam2.destroy
        @cam3.destroy
        @l1.destroy
        @l2.destroy
        @is.destroy
        @cs.destroy
      end
  
  end
end 