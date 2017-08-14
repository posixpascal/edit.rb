# ✏️ edit 

This is a **work in progress** gem for editing files and strings using a simple ruby DSL. It shines where regular string operations fail: In editing server configuration files.

When writing server automation scripts you will sooner or later come to the point where you need to enable for example a PHP extension using a script?
You may know the hassle of finding the right spot to start editing the file and even then you may feel unsafe just writing blindly in your source file.

Using the `edit` gem it's as simple as the following code to enable a new php extension:

```ruby
require "edit"

edit "/etc/php5/php.ini" do 
    move :to => "[extensions]"
    move :to => :next_line
    write_line "extension=mysql.so"
end
```

That's it.

## 1. Installation

Installation is done via bundler or gem:

```sh
gem "edit", '~> 1.0.0'
# or
gem install edit
```

## 2. Examples

### 2.1 Simple Edits:

edit provides a few helper methods for working with files, in this example we'll work on a simple string:

```ruby
require "edit"
edit "Hello World" do 
    replace "Hello", "This is a" # This is a world
    range :from => 0, :to => 4 do
        write "That" # That is a world
    end
    prepend_line "This is a test" # This is a test\nThat is a world
end
```

## 3. Commands

- append / append_line
- prepend / prepend_line
- delete / delete_line
- find / find_all
- next_line / end\_of\_line
- move
- range / range_each
- read / read_line
- replace / replace\_all / replace\_each
- write / write_line

... and more to come.

## 4. License

TBD

## 5. Contributing

TBD 
