class Coordinator < ApplicationRecord
    has_and_belongs_to_many :registries
    has_many :enrollments, dependent: :destroy
    has_many :participants, through: :enrollments

    validates :email, uniqueness: true
    validates :email, :name, :phone_number, presence: true 
    # validates :coordinator, uniqueness: { scope: :registries}
end
