class Editor
    def append_line(line)
        move :end
        write "\n#{line}"
        move :back
    end

    def append(line)
        move :end
        write "#{line}"
        move :back
    end
end