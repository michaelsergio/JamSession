$(document).ready ->
  tokenize = (selector, url) ->
    $(selector).tokenInput(url,
        crossDomain: false,
        tokenValue:'name',
        theme: 'facebook',
        hintText: $(this).attr('placeholder'),
        prePopulate: [{name: 'Guitar'}, {name: 'Drums'}]
    )
  
  tokenize('#search-skills', '/skills.json')
  tokenize('#search-styles', '/styles.json')

