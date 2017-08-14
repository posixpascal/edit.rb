class Editor
    attr_accessor :context, :cursor, :file, :mode
    def initialize file, mode = :append
        @file = file
        @mode = mode

        if @file.is_a? String
            buffer = file            
            if File.exist? @file
                open(@file, "r") do |f|
                    buffer = f.read()
                end
            end
        else
            buffer = file
        end

        @context = Context.new(buffer)        
    end

    def save
        if File.exist? @file
            open(@file, "w+") do |f|
                f.write(@context.read_all())
            end
        else
            return @context.read_all()
        end
    end
end

class EditorOutOfBoundsError
end