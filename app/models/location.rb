class Location < ApplicationRecord
    
    #relationships 
    has_many :camps
    
    #validations
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :street_1, presence: true
    validates :zip, presence: true, :format => { :with => /\A[0-9]{5}\z/ } 
    validates_length_of :zip, is: 5
    validates :max_capacity, presence: true, numericality: { greater_than_or_equal_to: 0}
    
    #scopes
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :alphabetical, -> { order(:name) }
end
