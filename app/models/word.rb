class Word < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :keyword, presence: true, length: { maximum: 50 }
end
