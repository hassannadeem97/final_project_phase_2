module Contexts
  module CampContext
  
      def create_camp
        @cam1 = FactoryBot.create(:camp, curriculum_id:1, location_id:1, cost: 1000.5, start_date: Date.today, end_date: Date.today, time_slot: "am", max_students:100 )
        @cam2 = FactoryBot.create(:camp, curriculum_id:2, location_id:2, cost: 1010.5, start_date: Date.today, end_date: 2018-07-18, time_slot: "pm", max_students:80 )
        @cam3 = FactoryBot.create(:camp, curriculum_id:3, location_id:3, cost: 2000.5, start_date: 2018-04-05, end_date: 2018-06-06, time_slot: "am", max_students:40, active: false )
      end
  
      def destroy_camp
        @cam1.destroy
        @cam2.destroy
        @cam3.destroy
      end
  
end
end 