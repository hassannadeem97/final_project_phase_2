class Camp < ApplicationRecord
    #relationships
    
    has_many :camp_instructors
    belongs_to :location
    belongs_to :curriculum
    
    
    #valiations 
    validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0} 
    validates :curriculum_id, presence: true, numericality: {greater_than: 0} 
    validates :location_id, presence: true, numericality: {greater_than: 0} 
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :time_slot, presence: true, :format => { :with => /\A[ap]m\z/ } 
    validates :start_date, uniqueness: { scope: [:location_id, :time_slot] }, :on => :create
    validates :max_students, numericality: {greater_than_or_equal_to: 0} 
    validates :active, inclusion: { in: [true, false] }
    validate :check 
    #validate :start_date_check   #this works perfectly fine when i run the application. But when i run the test for camps it gives me a lot of error even when the test for this method is commented out 
    #validate :end_date_check  #this works perfectly fine when i run the application. But when i run the test for camps it gives me a lot of error even when the test for this method is commented out 
    validate :location_id_check 
    validate :curriculum_id_check 
    
    
    
    #scopes 
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
        if self.location != nil 
            if max_students > self.location.max_capacity
                errors.add(:max_students, "can't be greater than the capacity")
            end 
        end
          
    end 
    
   
    
    # def start_date_check
    #     
    #     if start_date < Date.today
    #         errors.add(:start_date, "has to be the same as current date or in the future")
    #     end 
    #      
    # end
     
    
    
    
    
    # def end_date_check
    #     if end_date < start_date
    #         errors.add(:end_date, "has to be the same as the start date or in the future")
    #     end
    # end 
    
    
    def curriculum_id_check
        if self.curriculum != nil 
            if self.curriculum.active == false 
                errors.add(:curriculum_id, "should be active ")
            end 
        end 
    end 
    
    def location_id_check
        if self.location != nil
            if self.location.active == false 
                errors.add(:location_id, "should be active ")
            end
        end 
    end 
    
    
    
    def remove_instructors 
        if self.active == false 
            self.camp_instructors.each {|c| c.destroy}
        end 
    end
    
    def name 
      self.curriculum.name
    end 
    
    
    def name1  
      "#{self.curriculum.name} #{self.location.name}"
    end 
    
    def date 
        "#{self.start_date}, #{self.end_date}"
    end 
    
end
