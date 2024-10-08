class Article < ApplicationRecord
belongs_to :user
has_many :comments, dependent: :destroy
has_rich_text :content

    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    validates :content, presence: true, length: { minimum: 10 }
    validates :reference, presence: true, length: { minimum: 6 }
end
 