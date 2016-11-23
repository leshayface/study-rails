class Setting < ApplicationRecord
  validates :name, :presence => true

  before_create :replace_spaces_with_underscores

  def replace_spaces_with_underscores
    name_to_replace = self.name.gsub( /\W/, '_' ).downcase!
    self.name = name_to_replace
  end

  def self.read(name: '')
    begin
      self.find_by(name: name).value
    rescue 
      puts "#{name} was not set in settings"
    end
  end

end
