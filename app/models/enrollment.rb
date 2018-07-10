class Enrollment < ApplicationRecord
  belongs_to :registry
  belongs_to :participant
  belongs_to :coordinator
  
  validates :date_of_enrollment, :method_of_contact, :remarks, presence: true 
  validates :registry, uniqueness: { scope: :participant }
end
