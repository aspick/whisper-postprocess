require_relative './lib/whisper_postprocess'

processor = WhisperPostprocess.new
puts processor.process($stdin.read)
