require 'nokogiri'
require 'open-uri'

class WordParser
  def self.words_finder(url, original_text_selector, translated_text_selector)
    doc = Nokogiri::HTML(open(url))
    original_text = doc.css(original_text_selector)
    translated_text = doc.css(translated_text_selector)
    parsed_words = Hash[original_text.zip translated_text]
    parsed_words.map do |original, translation|
      if original.text.length > 0 && translation.text.length > 0
        [original.text.downcase, translation.text.downcase]
      end
    end
  end
end
