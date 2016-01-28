class WebSpellchecker < Spellchecker

  def initialize

  end

  def known(words)
      return DictionaryWord.where(word: words).map{|x| x[:word]}
  end
end
