class Editor
    def replace(search, replacement = "", opts = {}, &block)
        result = @context.buffer.join("").index(search)
        unless result.nil?
            start = result
            ending = start + search.split("").size
            if replacement
                range :from => start, :to => ending - 1 do
                    write replacement
                end
            end
        end
    end

    def replace_all(search, replacement = "", opts = {})
        result = @context.buffer.join("").index(search)        
        while not result.nil?
            replace(search, replacement)
            result = @context.buffer.join("").index(search)
        end
    end

     def replace_line(search, replacement = "", opts = {})
        result = @context.buffer.join("").index(search)        
        while not result.nil?
            replace(search, replacement)
            result = @context.buffer.join("").index(search)
        end
    end
end