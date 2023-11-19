class Task < ApplicationRecord
  # belongs_to :folder
  belongs_to :user

  validates :content, presence: true

  include RankedModel
  ranks :row_order
end