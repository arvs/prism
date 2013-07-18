http = require 'http'
swig = require 'swig'
path = require 'path'

path_to_template = (name) ->
  path.resolve __dirname, 'views', name

http.createServer (req, res) ->
  res.writeHead 200, 'Content-Type': 'text/html'
  args = 
    pagename: 'awesome people'
    authors: ['Paul', 'Jim', 'Jane']

  body = swig.compileFile(path_to_template('index.html')).render(args)
  res.end body
.listen 8000

console.log 'Server running at http://127.0.0.1:8000/'