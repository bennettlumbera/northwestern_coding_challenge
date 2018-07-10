class Participant < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :registries, through: :enrollments
    
    validates :name, uniqueness: true
    validates :name, :gender, :date_of_birth, presence: true
end
