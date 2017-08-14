class Editor
    def write text, opts = {}
        if opts[:at]
            @context.cursor.position = opts[:at]
        end
        if @mode == :overwrite
            overwrite text
        else
            @context.cursor.write text
        end
    end

    def write_line text, opts
        write "#{text}\n", opts
    end

    def overwrite text
        pos = @context.cursor.position
        text.each_byte do |i|
            @context.buffer[@context.cursor.position] = i.chr
            @context.cursor.position += 1
        end
        @context.cursor.move pos
    end
end