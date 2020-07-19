class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    s = self.new
    s.save
    s
  end
  
  def self.new_by_name(song_name)
    s = self.new
    s.name = song_name
    s
  end
  
  def self.create_by_name(song_name)
    s = self.new
    s.name = song_name
    s.save
    s
  end
  
  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end
  
  def self.new_from_filename(song_name)
    s = self.new
    s.name = name.split(" - ")[1]chomp(".mp3")
    s.artist_name = name.split(" - ")[0]
    s
  end
  
end
