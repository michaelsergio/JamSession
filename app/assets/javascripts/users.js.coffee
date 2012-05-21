$(document).ready ->
  tokenize = (selector, url) ->
    div = $(selector)
    if div.length > 0
      val = div.val()
      div.tokenInput(url,
          crossDomain: false,
          tokenValue:'name',
          theme: 'facebook',
          hintText: div.attr('placeholder'),
          preventDuplicates: true,
          prePopulate: (if val == "" then "" else JSON.parse(val)))
  
  tokenize('#filter #search-skills', '/skills.json')
  tokenize('#filter #search-styles', '/styles.json')


  tokenizeEdit = (selector, url) ->
    div = $(selector)
    if div.length > 0
      val = div.val()
      div.tokenInput(url,
        crossDomain: false,
        theme: 'facebook',
        preventDuplicates: true,
        prePopulate: (if val == "" then "" else JSON.parse(val)))

  # TODO these should have value be thier id, not thier name
  tokenizeEdit('.edit_user #search-styles', '/styles.json')
  tokenizeEdit('.edit_user #search-skills', '/skills.json')

