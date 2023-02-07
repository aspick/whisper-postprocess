require_relative './base_formatter'

module WhisperPostprocess::Formatter 
  class SimpleFormatter < BaseFormatter
    # @param [Cue] cue
    # @return [String]
    def print(cue)
      "#{cue.start} #{cue.text}"
    end
  end
end
