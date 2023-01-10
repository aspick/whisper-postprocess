require_relative './base_formatter'

class Formatter::SimpleFormatter < Formatter::BaseFormatter
  # @param [Cue] cue
  # @return [String]
  def print(cue)
    "#{cue.start} #{cue.text}"
  end
end
