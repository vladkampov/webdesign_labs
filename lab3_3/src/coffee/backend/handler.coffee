app.get '/', (req, res) ->
    res.sendFile path.join __dirname, '../..' ,'/index.html'

app.post '/filesystem', (req, res) ->
    res.send readFromXML fileXML
