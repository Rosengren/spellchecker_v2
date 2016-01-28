$(document).on 'page:change', ->
 # initialize current word to an empty string.
 word = ""
 $("#blogpost_contents").keypress (e) -> #update this line with correct selector and event
  inp = String.fromCharCode(e.which) # get the 1-character string that the user typed
  if (inp.match(/[a-z]/i)) #if this was a letter (use .match method and regular expression)
 #add letter to current word
    word += inp
  else
    if (word.match(/\w+/i)) # if the current word is a sequence of letters
      $.get window.location.origin + "/spellcheck/" + word, (data) -> #send ajax request with current word.
      #unless the word was known:
        if (!data.known)
          #join suggestions in a single string
          $("#spellcheck").text('The word "' + data.term + '" is unknown! Did you mean: ' + data.suggestions[0] + '?')
        word = ""
          #reset current word to an empty string
