// models/User.js
const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    name: { type: String, required: true },
    customerType: { type: String, required: true },
    aadharNumber: { type: String, required: true },
    address: { type: String, required: true },
    bankAccountNumber: { type: String, required: true },
    ifscCode: { type: String, required: true }
});

module.exports = mongoose.model('User', userSchema);

