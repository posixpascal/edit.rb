class Editor
    def read size
        result = []
        (1).upto(size) do
            result.push(@context.buffer[@context.cursor.position])
            @context.cursor.position += 1
        end
        return result.join("")
    end
end