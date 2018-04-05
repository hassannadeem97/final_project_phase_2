class Camp < ApplicationRecord
    has_many :camp_instructors
    belongs_to :location
    belongs_to :curriculum 
    
    validates :cost, presence: true
    validates :curriculum_id, presence: true
    validates :location_id, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :time_slot, presence: true, :format => { :with => /\A[ap]m\z/ } #not sure how to validate regex
    validates :start_date, uniqueness: { scope: [:location_id, :time_slot] }, :on => :create
    validates :max_students, numericality: {greater_than_or_equal_to: 0}  
    before_validation :check , on: :create# not sure how to test
    validate :start_date_check #not sure how to test
    validate :end_date_check #not sure how to test
    
    
    
    
    
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :alphabetical, -> {joins(:curriculum).order('curriculums.name')}
    scope :chronological, -> {order(:start_date, :end_date)}
    scope :morning, -> { where(time_slot: "am")}
    scope :afternoon, -> { where(time_slot: "pm")}
    scope :upcoming, -> {where("start_date >= ?", Date.today)}
    scope :past, -> {where("end_date < ?", Date.today)}
    scope :for_curriculum, ->(curriculum_id) { where("curriculum_id = ?", curriculum_id )}
    
    def check
        
        if max_students > self.location.max_capacity
            errors.add(:max_students, "maximum no. of students can't be greater than the capacity")
        end
        
    end 
    
   
    
    def start_date_check
    
      if start_date < Date.today
        errors.add(:start_date, "has to be the same as current date or in the future")
     end
    end 
    
    
    
    def end_date_check
      if end_date < start_date
        errors.add(:end_date, "has to be the same as the start date or in the future")
      end 
    end 
    
    
    
    def inactive #check by looping 
        if self.active == false 
            self.camp_instructors.each {|c| c.destroy}
        end 
    end
    
    def name  
      self.curriculum.name 
    end 
    
    
end
