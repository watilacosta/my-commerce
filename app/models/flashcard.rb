class Flashcard < ApplicationRecord
  belongs_to :user

  validates :question, presence: true, length: { in: 1..50 }
  validates :response, presence: true, length: { in: 1..1000 }
  validates :user, presence: true
end
