class Highlight < ApplicationRecord
  validates :title, :image, :presence => true
  scope :homepage, -> { where(active: true).order('highlights.order DESC') }
  validates :image, :url => true

end
