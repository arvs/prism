cheerio = require 'cheerio'
superagent = require 'superagent'
_ = require 'underscore'

songs_for_hype_user = (username) ->

  superagent
    .get 'http://hypem.com/playlist/loved/#{username}/json/1/data.js'
    .set 'Accept', 'application/json'
    .end (res) ->
      if _.keys(res.body).length
