class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  validates :commenter, presence: true, length: { minimum: 5, maximum: 100 }

end
