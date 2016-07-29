module Summarizer
  class KeyPoints
    def get_key_points(speech)
      tokenizer = TactfulTokenizer::Model.new

      splitted = speech.text.split('flag')

      tokenized = splitted.map do |x|
        tokenizer.tokenize_text(x).last
      end

      key_points = tokenized[0...-1]

      speech.update_attributes(key_points: key_points)
      return key_points
    end
  end
end
