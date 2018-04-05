
module Contexts
  module LocationContext
  
      def create_location
        @l1 = FactoryBot.create(:location, name: "ghanim", street_1:"al-taei", zip: "12345", max_capacity: 200)
        @l2 = FactoryBot.create(:location, name: "najma", street_1:"cltaei", zip: "12346", max_capacity: 100)
        @l3 = FactoryBot.create(:location, name: "muglina", street_1:"bltaei2", zip: "12347", max_capacity: 50, active: false)
      end
  
      def destroy_location
        @l1.destroy
        @l2.destroy
        @l3.destroy
      end
  
end
end 