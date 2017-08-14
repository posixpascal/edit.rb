def edit file, &block
    editor = Editor.new(file)
    editor.instance_eval(&block)
    editor.save()
end

require "editrb/Context"
require "editrb/Cursor"
require "editrb/Editor"

# Individual commands
require "editrb/commands/move"
require "editrb/commands/write"
require "editrb/commands/append"
require "editrb/commands/copy"
require "editrb/commands/delete"
require "editrb/commands/find"
require "editrb/commands/replace"
require "editrb/commands/range"
require "editrb/commands/prepend"
require "editrb/commands/read"
require "editrb/commands/lines"

