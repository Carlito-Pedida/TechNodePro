class Article < ApplicationRecord
has_many :comments

    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    validates :body, presence: true, length: { minimum: 10 }
    validates :reference, presence: true, length: { minimum: 6 }

    VALID_STATUSES = ["public", "private", "archived"]

    validates :status, inclusion: { in: VALID_STATUSES }
end
