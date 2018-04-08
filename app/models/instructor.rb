class Instructor < ApplicationRecord
    #relationship
    has_many :camp_instructors
    
    #validations
    
    validates :email, presence: true, uniqueness: true#, :format => { :with => /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ } works while running the applicaion but gives errors while testing instructor_test.rb  
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone, :format => { :with => /\A[0-9]/ }
    validates_length_of :phone, :maximum => 10
    validates :active, inclusion: { in: [true, false] }
    
    #scopes
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
    
    def for_camp(camp) #not sure if works 
        arr = Array.new
        camp.camp_instructors.each do |c|
            arr << c.instructor
        end 
        puts arr
    end 
    
    
end
