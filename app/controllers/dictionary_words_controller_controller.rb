require 'json'
require "#{Rails.root}/app/models/web_spellchecker.rb"

class DictionaryWordsControllerController < ApplicationController

  def spellcheck
      spellChecker = WebSpellchecker.new
      #@terms = spellChecker.correct(params[:term])
      term = params[:term]
      suggestions = spellChecker.correct(term)
      known = spellChecker.known(term).any?

      hash = {
        :term => term,
        :known => known,
        :suggestions => suggestions}

      render json: hash
  end
end
