class CampInstructor < ApplicationRecord
    belongs_to :instructor
    belongs_to :camp
    validates :camp_id, presence: true
    validates :instructor_id, presence: true
    validates_uniqueness_of :camp_id, scope: :instructor_id
   
end
