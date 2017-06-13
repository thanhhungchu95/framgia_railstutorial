class Micropost < ApplicationRecord
  belongs_to :user

  scope :sort_by_post_time, ->{order created_at: :desc}

  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.micropost.content.max_length}
end
