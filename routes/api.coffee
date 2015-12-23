module.exports = (modelName) ->
  express  = require 'express'
  router   = express.Router()
  mongoose = require 'mongoose'
  model    = require "../models/#{modelName}"

  router.get '/', (req, res, next) ->
    model.find req.query, (err, records) ->
      return next(err) if err
      res.json records
  router.post '/', (req, res, next) ->
    model.create req.body, (err, post) ->
      return next(err) if err
      res.json post

  router.get '/:id', (req, res, next) ->
    model.findById req.params.id, (err, post) ->
      return next(err) if err
      res.json post

  router.put '/:id', (req, res, next) ->
    model.findByIdAndUpdate req.params.id, req.body, (err, post) ->
      return next(err) if err
      res.json post

  router.delete '/:id', (req, res, next) ->
    model.findByIdAndRemove req.params.id, req.body, (err, post) ->
      return next(err) if err
      res.json post

  router
