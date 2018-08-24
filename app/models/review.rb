class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  delegate :name, :to => :user
  delegate :title, :to => :book
  scope :by_select_review, -> {
    select :id, :content, :num_rate, :user_id, :book_id
  }
  scope :by_order, -> {order created_at: :desc}
  validates :content, presence: true, length: {maximum: Settings.length_description}
  validates :num_rate, presence: true, length: {maximum: Settings.post}
  validates :user_id, presence: true, length: {maximum: Settings.post}
  validates :book_id, presence: true, length: {maximum: Settings.post}
end
