class Message < ApplicationRecord
  belongs_to :person, dependent: :destroy
  validates :body, presence: true, length: { maximum: 96 }

  scope :most_recent, -> { limit(3) }
end
