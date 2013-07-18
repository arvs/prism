mongoose = require("mongoose")
Schema = mongoose.Schema

user_schema = new Schema(
  _id: Number
  hype_username: String
  songs: [
    type: Schema.Types.ObjectId
    ref: "Song"
  ]
)

song_schema = new Schema(
  _id: Number
  sc_url: String
  hype_url: String
  name: String
  artist: String
  thumbnail: String
)

module.exports = mongoose.model "Songs", song_schema
module.exports = mongoose.model "User", user_schema
