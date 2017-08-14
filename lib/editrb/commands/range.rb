class Editor
    def range opts, &block
        if opts[:from] and opts[:to]
            range_from(opts, &block)
        end
    end

    def range_from(opts = {}, &block)
        new_ctx = @context.buffer[opts[:from]..opts[:to]]
        if new_ctx.nil?
            throw EditorOutOfBoundsError    
        end
        
        new_editor = Editor.new(new_ctx, :overwrite)        
        if opts.has_key? :overwrite
            if not opts[:overwrite]
                new_editor = Editor.new(new_ctx)
            end
        end
        new_editor.instance_eval(&block)
        @context.buffer[opts[:from]..opts[:to]] = new_editor.context.buffer
    end
end