class Instructor < ApplicationRecord
    has_many :camp_instructors
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :phone, :format => { :with => /\A[0-9]/ } 
    validates_length_of :phone, :maximum => 10
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :alphabetical, -> { order(:last_name,:first_name) } 
    scope :empty, -> {where(bio: nil)}
    
    def name
       "#{last_name},#{first_name}"
    end 
    
    def proper_name
       "#{first_name} #{last_name}"
    end 
    
    def for_camp #note tested yet
        self.camp_instructors.each {where self.camp_id == self.camps.id}
    end 
    
    
end
