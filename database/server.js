const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

// Connect to MongoDB
mongoose.connect('mongodb://localhost:27017/userdb', {
    useNewUrlParser: true,
    useUnifiedTopology: true
});

mongoose.connection.on('connected', () => {
    console.log('Connected to MongoDB');
});

// MongoDB User Schema with custom ID
const userSchema = new mongoose.Schema({
    _id: { type: Number, required: true },
    name: { type: String, required: true },
    customerType: { type: String, required: true },
    aadharNumber: { type: String, required: true },
    address: { type: String, required: true },
    bankAccountNumber: { type: String, required: true },
    ifscCode: { type: String, required: true }
});

const User = mongoose.model('User', userSchema);

// Helper function to get the next ID
const getNextId = async () => {
    const lastUser = await User.findOne().sort({ _id: -1 }).exec();
    return lastUser ? lastUser._id + 1 : 101; // Start from 101 if no users exist
};

// Create User
app.post('/users/create', async (req, res) => {
    try {
        const nextId = await getNextId();
        const user = new User({
            _id: nextId,
            name: req.body.name,
            customerType: req.body.customerType,
            aadharNumber: req.body.aadharNumber,
            address: req.body.address,
            bankAccountNumber: req.body.bankAccountNumber,
            ifscCode: req.body.ifscCode
        });

        const savedUser = await user.save();
        res.status(201).json(savedUser);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

// Retrieve User by ID
app.get('/users/:id', async (req, res) => {
    try {
        const user = await User.findById(req.params.id).exec();
        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }
        res.status(200).json(user);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

// Update User
app.put('/users/update/:id', async (req, res) => {
    try {
        const updatedUser = await User.findByIdAndUpdate(
            req.params.id,
            {
                name: req.body.name,
                customerType: req.body.customerType,
                aadharNumber: req.body.aadharNumber,
                address: req.body.address,
                bankAccountNumber: req.body.bankAccountNumber,
                ifscCode: req.body.ifscCode
            },
            { new: true }
        ).exec();
        if (!updatedUser) {
            return res.status(404).json({ error: 'User not found' });
        }
        res.status(200).json(updatedUser);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

// Delete User
app.delete('/users/:id', async (req, res) => {
    try {
        const deletedUser = await User.findByIdAndDelete(req.params.id).exec();
        if (!deletedUser) {
            return res.status(404).json({ error: 'User not found' });
        }
        res.status(200).json({ message: 'User deleted successfully' });
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

// Handle non-existent endpoint
app.use((req, res) => {
    res.status(404).json({ error: 'Endpoint not found' });
});

// Start the server
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
