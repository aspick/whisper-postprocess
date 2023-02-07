module WhisperPostprocess::Formatter
  class BaseFormatter
    # @abstract
    # @param [Cue] cue
    # @return [String]
    def print(cue)
      ''
    end

    # @param [Array<Cue>] cues
    # @return [String]
    def print_all(cues)
      cues.map { |cue| print(cue) }.join("\n")
    end
  end
end
