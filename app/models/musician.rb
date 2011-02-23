class Musician < ActiveRecord::Base
  belongs_to :category
  validates :name, :presence => true, :uniqueness => true
  validates :year, :presence => true
  validates :category, :presence => true
end
