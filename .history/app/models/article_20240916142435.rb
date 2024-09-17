class Article < ApplicationRecord
    validates :title, presence: true, length: {minimun: 6, maximum: 100}
    validates :description, presence: true, length: {minimun: 10, maximum: 300}
    validates :body, presence: true, length: {minimun: 10}
    validates :title, presence: true, length: {minimun: 6}
end
