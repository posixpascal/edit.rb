class Cursor
    attr_accessor :ctx, :position, :file, :last_positions
    def initialize(ctx, position)
        @ctx = ctx
        @position = 0
        @last_positions = []
    end


    def write(text)
        text.each_byte do |byte|
            @ctx.buffer.insert(@position, byte.chr)
            @position += 1
        end
        @ctx.buffer.flatten!
    end

    def size
        @ctx.buffer.size
    end

    def move(position)
        unless position == :back
            @last_positions.push(@position)    
        end

        case position
        when :back 
            @position = @last_positions.pop()
        when :start
            @position = 0
        else 
            @position = position
        end
    end
end