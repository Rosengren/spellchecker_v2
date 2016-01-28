class DictionaryWordsControllerController < ApplicationController
  def spellcheck
      @term = params[:term]
  end
end
