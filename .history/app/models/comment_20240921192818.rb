class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :reply, dependent: :destroy

  validates :body, presence: true, length: { minimum: 10 }
end
