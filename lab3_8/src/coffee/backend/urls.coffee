app.use '/', express.static path.join __dirname, '../..' ,'/build'
app.use '/lib', express.static path.join __dirname, '../..' ,'/node_modules'
app.use '/img', express.static path.join __dirname, '../..' ,'/img'

app.listen 8080
