class Editor
    def move position, opts = {}
        if position == :end
            position = @context.buffer.size()
        end

        if opts[:to] and opts[:to].is_a? String
            position = @context.buffer.join("").index(opts[:to])
        elsif opts[:to] == :next_line
            until @context.buffer[@context.cursor.position] == "\n"
                @context.cursor.position += 1
                if @context.cursor.position >= @context.buffer.size
                    return nil
                    break
                end
                @context.cursor.position += 1
            end
        end
        
        @context.cursor.move(position)
        return position
    end
end