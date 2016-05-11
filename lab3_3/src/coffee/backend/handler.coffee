app.get '/', (req, res) ->
    res.sendFile path.join __dirname, '../..' ,'/index.html'

app.post '/filesystem', (req, res) ->
    res.send xml

app.post '/showfile', (req, res) ->
    res.set 'content-type','text/html'
    fs.readFile path.join(__dirname, '../..', req.body.link), 'utf-8', (err, data)->
        if err
            throw err
        res.send data
