# deps
express = require 'express'
routes = require './routes'
tasks = require './tasks'
mongoose = require 'mongoose'


# Get yo' models
model = require "./models/model.coffee"

app = express()
server = require('http').createServer app

# Configuration
app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.favicon __dirname + "/public/favicon.ico"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static __dirname + "/public"

port = false

app.configure 'development', ->
  port = 3000
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )
  mongoose.connect 'mongodb://localhost/<app_name>'

app.configure 'production', ->
  port = 80
  app.use express.errorHandler()
  # TODO:
  # add production database connection string
  # mongoose.connect('mongodb://localhost/<app_name>');

db = mongoose.connection
db.on 'error', console.error.bind console, 'connection error:'
db.once 'open', ->
  console.log 'opened'


server.listen port, ->
  console.log 'listening'


app.get '/', routes.home

# Run background tasks here:


# Run immediately
# tasks.myTask();

# Run periodically
# setInterval(tasks.myTask, 1000 * 60 * 10);
