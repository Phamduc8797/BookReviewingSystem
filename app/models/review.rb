class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  delegate :name, to: :user, prefix: true, allow_nil: true
  delegate :title, to: :user, prefix: true, allow_nil: true
  scope :by_select_review, -> {
    select :id, :content, :num_rate, :user_id, :book_id
  }
  scope :by_order, -> {order created_at: :desc}
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.length_content_review}
end
