class WebSpellchecker < Spellchecker

  def initialize

  end

  def correct(w)
    return ["testing", "purposes"]
  end

  def known(words)
      return DictionaryWord.where(word: words).map{|x| x[:word]}
  end
end
