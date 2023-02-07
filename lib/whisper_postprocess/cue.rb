class WhisperPostprocess
  class Cue
    attr_accessor :start, :stop, :text

    TIME_CODE_REGEX = /\d{2}:\d{2}:\d{2}\.\d{3}/
    CUE_LINE_REGEX = /\[(#{TIME_CODE_REGEX}) --> (#{TIME_CODE_REGEX})\]\s+(.*)/

    # @param text [String] line text
    # @return [Cue, nil]
    def self.parse_line(text)
      if text =~ CUE_LINE_REGEX
        self.new($1, $2, $3)
      else
        nil
      end
    end

    # @param text [String] text
    # @return [Array<Cue>]
    def self.parse_all(text)
      text.each_line.map { |line| self.parse_line(line) }.compact
    end

    # @param start [String] start time code
    # @param stop [String] stop time code
    # @param text [String] text
    def initialize(start, stop, text)
      @start = start
      @stop = stop
      @text = text
    end

    # @return [String]
    def to_s
      "[#{@start} --> #{@stop}] #{@text}"
    end

    # @param other [Cue]
    # @return [Boolean]
    def ==(other)
      @start == other.start && @stop == other.stop && @text == other.text
    end

    # @param other [Cue]
    # @return [Boolean]
    def eql?(other)
      self == other
    end

    # @param other [Cue]
    # @return [Integer]
    def <=>(other)
      @start <=> other.start
    end

    # @param other [Cue]
    # @return [Boolean]
    def connected?(other)
      return false unless other
      (@start == other.stop || @stop == other.start) && @text == other.text
    end

    # @param cues [Array<Cue>]
    # @return [Array<Cue>]
    def self.concat(cues)
      temp_cues = cues.dup

      to_delete_indices = []

      pointed_cue = nil
      temp_cues.each_with_index do |cue, index|
        if cue.connected?(pointed_cue)
          pointed_cue.stop = cue.stop
          to_delete_indices << index
        else
          pointed_cue = cue
        end
      end

      to_delete_indices.reverse.each do |index|
        temp_cues.delete_at(index)
      end

      temp_cues
    end
  end
end
