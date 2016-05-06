fs = require 'fs'
xml2js = require 'xml2js'
express = require 'express'
path = require "path"
bodyParser = require 'body-parser'

parser = new xml2js.Parser()

extracted = []
xml = fs.readFile path.join(__dirname, '../..', 'barChart.xml'), (err, data) ->
    parser.parseString data, (err, result)->
        extracted = result['bar-chart']['bar']


app = express()

app.use '/', express.static path.join __dirname, '../..' ,'/build'
app.use '/lib', express.static path.join __dirname, '../..' ,'/node_modules'
app.use '/img', express.static path.join __dirname, '../..' ,'/img'
app.use bodyParser.json type: 'application/*+json'
app.use bodyParser.urlencoded extended: true

app.get '/', (req, res) ->
    res.sendFile path.join __dirname, '../..' ,'/index.html'

app.post '/doc/collection', (req, res)->
    res.send extracted

app.listen 8080
