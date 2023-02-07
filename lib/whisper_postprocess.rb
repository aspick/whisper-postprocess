require_relative './whisper_postprocess/cue'
require_relative './whisper_postprocess/formatter/simple_formatter'

class WhisperPostprocess
  # @param formatter [Class<Formatter::BaseFormatter>]
  def initialize(formatter: Formatter::SimpleFormatter)
    @formatter = formatter.new
  end

  # @param input_text [String]
  # @return [String]
  def process(input_text)
    cues = Cue.parse_all(input_text)

    # concat
    ## concat same output lines
    cues = Cue.concat(cues)

    # print
    ## print output with simple format
    Formatter::SimpleFormatter.new.print_all(cues)
  end
end
