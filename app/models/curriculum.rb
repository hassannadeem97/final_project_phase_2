class Curriculum < ApplicationRecord
    has_many :camps
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :min_rating, presence: true, numericality: { greater_than_or_equal_to: 0}
    validates :max_rating, presence: true, numericality: { less_than_or_equal_to: 3000}
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :alphabetical, -> { order(:name) }
    scope :for_rating, ->(rating) {where(' ? >= min_rating and ? <= max_rating ', rating, rating)} 
    
end
