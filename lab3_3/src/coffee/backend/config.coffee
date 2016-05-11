fs = require 'fs'
xml2js = require 'xml2js'
express = require 'express'
path = require "path"
bodyParser = require 'body-parser'
fileXML = path.join __dirname, '../..', 'dirTree.xml'
parser = new xml2js.Parser()
util = require 'util'

app = express()

# extracted = []
# titles = []
# xml = fs.readFile file, (err, data) ->
#     parser.parseString data, (err, result)->
#         extracted = result['bar-chart']['bar']
#         extracted.map (el)->
#             titles.push el.title[0]

app.use bodyParser.json type: 'application/*+json'
app.use bodyParser.urlencoded extended: true

dirTree = (filename)->
    stats = fs.lstatSync filename
    info = path: filename, name: path.basename filename

    if stats.isDirectory()
        info.type = "folder"
        info.children = fs.readdirSync(filename).map (child)->
            return dirTree(filename + '/' + child)
    else 
        info.type = "file"

    return info;

writeToXML = (filename, dir)->
    builder = new xml2js.Builder rootName: 'filesystem'
    xml = builder.buildObject {'dir': dir}
    fs.writeFile fileXML, xml

# readFromXML = (filename)->
xml = []
fs.readFile fileXML, (err, data)->
    if err
        throw err
    parser.parseString data, (err, result)->
        xml = result['filesystem']['dir'][0]['children']
        
writeToXML fileXML, dirTree(path.join(__dirname, '../..', 'public'))