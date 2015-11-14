class Comment < ActiveRecord::Base
  belongs_to :article
  validates :author_name, presence: true
  validates :body, presence: true
end
