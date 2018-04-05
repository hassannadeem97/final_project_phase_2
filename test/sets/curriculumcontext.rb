
module Contexts
  module CurriculumContext
  
      def create_curriculum
        @is = FactoryBot.create(:curriculum, name: "IS", min_rating: 125, max_rating: 2900 )
        @cs = FactoryBot.create(:curriculum, name: "CS", min_rating: 122, max_rating: 1900 )
        @ba = FactoryBot.create(:curriculum, name: "BA", min_rating: 122, max_rating: 1900, active: false )
      end
  
      def destroy_curriculum
        @is.destroy
        @cs.destroy
        @ba.destroy
      end
  
end
end 