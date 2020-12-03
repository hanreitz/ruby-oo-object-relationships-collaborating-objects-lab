class MP3Importer
    attr_accessor :path

    @@library = []

    def initialize(path)
        @path = path
    end

    def files
        file_list = Dir.entries(@path)
        file_list.delete_if {|entry| !entry.include?(".mp3")}
    end

    def import
        files.each {|song| @@library << Song.new_by_filename(song)}
    end
end