class Artist
    attr_accessor :name

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

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        instances = self.all.find {|artist| artist.name == name}
        instances == nil ? self.new(name) : instances
    end

    def print_songs
        songs.each {|song| puts song.name}
    end
end