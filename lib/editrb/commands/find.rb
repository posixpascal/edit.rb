class Editor
    def find query, &block
        
        if block_given? 
            instance_eval(&block)
        end
    end
end