var express = require('express')

var server = express()

server.get('/', function(req, res) {
  res.write('hello world')
  res.end()
})

server.listen(8080)
