$(function() {
  var $name = $("input[name='name']") 
  var $shoutout = $("input[name='shoutout']")

  $("#submit").click(function() {
      var name = $name.val()
      var shoutout = $shoutout.val()

      $('#shoutouts').load('/', {
         name: name, shoutout: shoutout 
      })
      $shoutout.val('')
  })
})
