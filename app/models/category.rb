class Category < ActiveRecord::Base
  has_many :musicians
  validates :name, :presence => true, :uniqueness => true
end
