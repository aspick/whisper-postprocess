class Cue
  attr_accessor :start, :stop, :text

  TIME_CODE_REGEX = /\d{2}:\d{2}:\d{2}\.\d{3}/
  CUE_LINE_REGEX = /\[(#{TIME_CODE_REGEX}) --> (#{TIME_CODE_REGEX})\]\s+(.*)/

  # @param text [String] line text
  # @return [Cue, nil]
  def self.parse_line(text)
    if text =~ CUE_LINE_REGEX
      Cue.new($1, $2, $3)
    else
      nil
    end
  end

  # @param text [String] text
  # @return [Array<Cue>]
  def self.parse_all(text)
    text.each_line.map { |line| Cue.parse_line(line) }.compact
  end

  def initialize(start, stop, text)
    @start = start
    @stop = stop
    @text = text
  end

  def to_s
    "[#{@start} --> #{@stop}] #{@text}"
  end

  def ==(other)
    @start == other.start && @stop == other.stop && @text == other.text
  end

  def eql?(other)
    self == other
  end

  def <=>(other)
    @start <=> other.start
  end

  def connected?(other)
    return false unless other
    (@start == other.stop || @stop == other.start) && @text == other.text
  end

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


    # cues = cues.sort
    # cues.each_with_index do |cue, index|
    #   next_cue = cues[index + 1]
    #   if next_cue && cue.stop == next_cue.start && cue.text == next_cue.text
    #     cue.stop = next_cue.stop
    #     cues.delete_at(index + 1)
    #   end
    # end
    # cues
  end
end
