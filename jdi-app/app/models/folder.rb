class Folder < ApplicationRecord
  has_many :users
  has_many :tasks
end
