$(document).ready ->
  tokenize = (selector, url) ->
    $(selector).tokenInput(url,
        crossDomain: false,
        tokenValue:'name',
        theme: 'facebook',
        hintText: $(this).attr('placeholder'),
        #prePopulate: [{name: 'Guitar'}, {name: 'Drums'}]
    )
  
  tokenize('#filter #search-skills', '/skills.json')
  tokenize('#filter #search-styles', '/styles.json')


  tokenizeEdit = (selector, url) ->
    $(selector).tokenInput(url,
      crossDomain: false,
      theme: 'facebook',
      hintText: $(this).attr('placeholder'))

  # TODO these should have value be thier id, not thier name
  tokenizeEdit('.edit_user #search-skills', '/skills.json')
  tokenizeEdit('.edit_user #search-styles', '/styles.json')

