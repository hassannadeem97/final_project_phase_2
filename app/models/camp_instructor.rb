class CampInstructor < ApplicationRecord
    
    belongs_to :instructor
    belongs_to :camp
    validates :camp_id, presence: true
    validates :instructor_id, presence: true
    validates_uniqueness_of :camp_id, scope: :instructor_id
    validate :instructor_active
    validate :camp_active
    
    def instructor_active
        if self.instructor != nil
            if self.instructor.active == false
                errors.add(:instructor_id, "should be active")
            end 
        end 
    end 
    
     
    def camp_active
        if self.camp != nil
            if self.camp.active == false
                errors.add(:camp_id, "should be active")
            end 
        end 
    end 
   
end
