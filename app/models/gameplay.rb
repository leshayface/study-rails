class Gameplay < ApplicationRecord

  belongs_to :member
  belongs_to :game

  has_many :comments, as: :commentable

  validates :link, :url => true
  validates :title, :length => { :minimum => 10 }
  validates :title, :link, :presence => true

  extend FriendlyId
  friendly_id :title, use: :slugged, :use => :history

  self.per_page = 3

  before_save :ensure_corrected_imgur_link
  before_save :ensure_corrected_youtube_link

  def ensure_corrected_imgur_link
    if is_image
        imgur_id = link.split('/').last
        self.link = "http://i.imgur.com/#{imgur_id}.jpg"
    end
  end

  def ensure_corrected_youtube_link
    if link.include? 'youtu.be'
        uri = Embiggen::URI.new(URI(link))
        self.link = uri.expand(:timeout => 8).to_s.chomp! "&feature=youtu.be"
    end
  end


  def is_image
    return true if link.include? 'imgur'
  end

  def is_youtube
    return true if link.include? 'youtube'
  end

  def youtube_video_id_from_link
    link.split('=').lastr
  end



end
