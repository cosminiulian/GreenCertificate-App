var mongoose = require("mongoose") // include mongoose db

// Schema for Employee
var personSchema = new mongoose.Schema({
  qrCode: { type: String, required: true },
  firstName: { type: String, required: true },
  lastName: { type: String, required: true },
  email: { type: String, required: true },
  birthDate: { type: String, required: true },
  isCertificateExpired: { type: Boolean, required: true }
})

// Creates the Employee Model
const personModel = mongoose.model("person", personSchema)

// Exports data to be used in other files
module.exports = personModel
