nodeStatic = require 'node-static'

fileServer = new nodeStatic.Server './public', { cache: 10 }

require('http').createServer((request, response) ->
  request.addListener('end', ->
    fileServer.serve(request, response)
  ).resume()
).listen(8080)

