class Game < ApplicationRecord
   validates :title, :website, :image, :presence => true
   validates :website, :url => true
   validates :image, :url => true

   has_many :gameplays


   extend FriendlyId
   friendly_id :title, use: :slugged, :use => :history


end
