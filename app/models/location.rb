class Location < ApplicationRecord
    has_many :camps 
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :street_1, presence: true
    validates :zip, presence: true, :format => { :with => /\A[0-9]{5}\z/ } # dont know how to validate regex
    validates_length_of :zip, is: 5
    validates :max_capacity, presence: true, numericality: { greater_than_or_equal_to: 0}
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :alphabetical, -> { order(:name) }
end
