require 'json'
require "#{Rails.root}/app/models/web_spellchecker.rb"

class DictionaryWordsControllerController < ApplicationController
  respond_to :json

  def spellcheck
      spellChecker = WebSpellchecker.new
      #@terms = spellChecker.correct(params[:term])
      hash = {
        :term => params[:term],
        :known => true,
        :suggestions => spellChecker.correct(params[:term])}

      render json: hash
  end
end
