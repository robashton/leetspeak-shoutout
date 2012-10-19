debug = !!process.env.DEBUG
Browser = require 'zombie'
fork = require('child_process').fork
_ = require 'underscore'
http = require 'http'

class ManualContext
  constructor: ->
    @server = null
    @port = parseInt(Math.random() * 63000) + 1000
    @closed_listener = null

  start: (done) =>
    @server= fork(process.cwd() + '/server.js',[], {
      silent: !debug,
      env: {
        PORT: @port
        TEST: true
      }
    })
    @wait_for_server(done)

  create_client: (cb) =>
    return new ManualClient(this, @port)

  dispose: =>
    @server.kill()


class ManualClient
  constructor: (context, port) ->
    @browser = null
    @page = null
    @port = port
    @base = 'http://localhost:' + port
    @context = context

  navigate: (url, done) =>
    @page = @base + url
    @browser = new Browser({debug: debug})
    @browser.visit @page, done

  load_index: (cb) =>
    @navigate '/', cb
    
module.exports = ManualContext
