$(document).ready ->
  $('#styles').tokenInput('/styles.json', {crossDomain: false, tokenValue:'name', theme: 'facebook'})
