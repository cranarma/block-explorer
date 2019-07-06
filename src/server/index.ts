import * as express from 'express'
import * as cookieParser from 'cookie-parser'
import * as bodyParser from 'body-parser'
import * as cors from 'cors'

//I'll be using a simple JSON-based database for CRUD demonstration purposes
const lowdb = require('lowdb')
const FileSync = require('lowdb/adapters/FileSync')
const adapter = new FileSync('db.json')
const db = lowdb(adapter)

// Set some defaults
db.defaults({ posts: [], user: {}, count: 0 })
  .write()

import mainRoutes from './routes'

const PORT = 8080

const app = express()

app.use(cors())
app.use(cookieParser())
app.use(bodyParser.json())
app.use(mainRoutes)

app.listen(PORT, () => {
  console.log(`App is running at http://localhost:${PORT}`)
})
