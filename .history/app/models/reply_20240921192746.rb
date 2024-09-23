class Reply < ApplicationRecord
    belongs_to :comment
    belongs_to :user
  
    validates :reply_body, presence: true, length: { minimum: 10 }
  end