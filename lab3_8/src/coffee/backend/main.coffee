fs = require 'fs'
xml2js = require 'xml2js'
express = require 'express'
path = require "path"
bodyParser = require 'body-parser'
file = path.join __dirname, '../..', 'barChart.xml'
parser = new xml2js.Parser()

app = express()

extracted = []
xml = fs.readFile file, (err, data) ->
    parser.parseString data, (err, result)->
        extracted = result['bar-chart']['bar']

app.use '/', express.static path.join __dirname, '../..' ,'/build'
app.use '/lib', express.static path.join __dirname, '../..' ,'/node_modules'
app.use '/img', express.static path.join __dirname, '../..' ,'/img'
app.use bodyParser.json type: 'application/*+json'
app.use bodyParser.urlencoded extended: true

app.get '/', (req, res) ->
    res.sendFile path.join __dirname, '../..' ,'/index.html'

app.post '/doc/collection', (req, res)->
    res.send extracted

app.post '/doc/models', (req, res)->
    builder = new xml2js.Builder rootName: 'bar-chart'
    extracted.push req.body
    console.log extracted
    xml = builder.buildObject {'bar': extracted}
    fs.writeFile file, xml
    res.send "ok"

app.listen 8080
