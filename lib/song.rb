class Song
    attr_accessor :artist, :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        artist = filename.split(" - ")[0]
        name = filename.split(" - ")[1]
        song_new = self.new(name)
        song_new.artist_name = artist
        song_new.name = name
        song_new
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end

end