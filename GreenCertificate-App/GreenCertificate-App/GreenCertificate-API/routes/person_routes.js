var personModel = require("../models/person_model") // include person model

const express = require("express")
const personRoute = express.Router() // create custom router

// POST REQUEST: - CREATE PERSON
personRoute.post("/createPerson", (req, res) => {
  personModel.findOne({ qrCode: req.body.qrCode }).then((dbItem) => {
    // Get the food with that barcode
    if (dbItem == null) {
      // verify if the food with that barcode exists
      var person = new personModel({
        qrCode: req.body.qrCode,
        firstName: req.body.firstName,
        lastName: req.body.lastName,
        email: req.body.email,
        birthDate: req.body.birthDate,
        isCertificateExpired: req.body.isCertificateExpired
      })

      person.save().then(() => {
        if (person.isNew == false) {
          // if the data is saved on the server and database then return false
          res.json({
            message: "Person created successfully!"
          })
        } else {
          res.json({
            message: "Failed to create the Person!"
          })
        }
      })
    } else {
      // Get the food with that barcode
      res.json({
        message: "The person already exists!"
      })
    }
  })
})

// GET REQUEST: - TEST !!!
personRoute.get("/getPerson", (req, res) => {
  personModel.findOne({ qrCode: req.query.qrCode }).then((dbItem) => {
    // Get the food with that barcode
    if (dbItem == null) {
      // verify if the food with that barcode exists

      res.json({
        message: "The person doesn't exists!"
      })
    } else {
      // Get the food with that barcode
      res.json({
        person: dbItem
      })
    }
  })
})

module.exports = personRoute // exports the router when is included
