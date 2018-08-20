class Author < ApplicationRecord
  validates :name, presence: true, length: {maximum: Settings.post}
end
