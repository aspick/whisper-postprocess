require_relative './lib/cue'
require_relative './lib/formatter/simple_formatter'

# parse
## parse whisper output file
text = $stdin.read
cues = Cue.parse_all(text)

# concat
## concat same output lines
cues = Cue.concat(cues)

# print
## print output with simple format
new_text = Formatter::SimpleFormatter.new.print_all(cues)
puts new_text
