class Editor
    def prepend_line line
        move 0
        write "#{line}\n"
        move :back
    end

    def prepend line
        move 0
        write "#{line}"
        move :back
    end
end