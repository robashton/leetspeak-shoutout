var express = require('express')
var jade = require('jade')

var server = express()

server.use(express.static(__dirname + '/site'))
server.set('view engine', 'jade')
server.set('views', 'views')
server.engine("jade", jade.__express)

server.get('/hello', function(req, res) {
  res.write('hello world')
  res.end()
})


server.listen(8080)
