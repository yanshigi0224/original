class Diary < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 3000 }
  validates :title, presence: true, length: { maximum: 100 }
end
