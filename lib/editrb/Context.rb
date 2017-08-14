require 'tempfile'

class Context
    attr_accessor :buffer, :original_path, :cursor
    def initialize src
        @cursor = Cursor.new(self, 0)
        @buffer = []

        if src.is_a? String
            @buffer = src.split("")
        else
            @buffer = src
        end
    end

    def read_all
        @buffer.join("")
    end

    
    def method_missing(name, args = [])
        @cursor.send(name, args)
    end
end