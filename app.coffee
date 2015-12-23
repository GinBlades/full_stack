path       = require 'path'
express    = require 'express'
bodyParser = require 'body-parser'
cors       = require 'cors'
mongoose   = require 'mongoose'
app        = express()

routes = require './routes/index'
demo = require('./routes/api')('Demo')

app.set 'view engine', 'jade'

mongoose.connect 'mongodb://localhost/fullStack', (err) ->
  if err
    console.log 'connection error', err
  else
    console.log 'connection successful'

app.use bodyParser.json()
app.use express.static(path.join(__dirname, 'bower_components'))
app.use express.static(path.join(__dirname, 'public'))
app.use express.static(path.join(__dirname, 'bower_components/bootstrap-sass/assets'))

app.use '/', routes
app.use '/api/demos', demo

app.use (req, res, next) ->
  err = new Error 'Not Found'
  err.status = 404
  next err

app.use (err, req, res, next) ->
  res.status(err.status || 500)
  res.render 'error',
    message: err.message
    error: err

app.listen 3000
console.log 'Express app running on port 3000'
module.exports = app
