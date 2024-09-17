class Article < ApplicationRecord
    validates :title, presence: true, length: {minimun: 6, maximum: 100}
end
