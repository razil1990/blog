class Article < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: {minimum: 2}
  validates :text, presence: true, length: {minimum: 10}
end
