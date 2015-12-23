mongoose = require 'mongoose'

DemoSchema = new mongoose.Schema
  name: String,
  updated_at:
    type: Date
    default: Date.now

module.exports = mongoose.model 'Demo', DemoSchema
