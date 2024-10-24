# KrishiConnect

## Project Overview

**KrishiConnect** is an app developed to facilitate direct sales between farmers, consumers, and retailers, helping to eliminate middlemen and boost farmers' profits. The app was developed as part of the Smart India Hackathon and has benefited over 500 farmers by simplifying the process of selling products. The app also supports multilingual interactions, allowing farmers to easily fill out forms using voice input.

## Features

- **Direct Sales**: Enables farmers to directly sell their products to consumers and retailers, bypassing intermediaries.
- **Voice-to-Form Feature**: Integrated **Wit.ai** and **Google Translate API** to allow users to complete forms using voice input, supporting multiple languages and reducing form completion time by 60%.
- **User Roles**: Distinct interfaces and functionalities for farmers, consumers, and retailers.
- **Product Management**: Farmers can add products, set prices, and specify quantities.
- **Order and Bidding**: Consumers can place orders or bid for products, and farmers can manage their orders directly through the app.

## Technologies Used

- **Frontend**: Dart, Flutter
- **Backend**: Node.js, MongoDB
- **Speech Recognition**: Wit.ai, Google Translate API
- **Version Control**: GitHub

## Installation and Setup

To run the app locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone [repository-url]
2. Navigate to the project directory:
    ```bash
    cd KrishiConnect
3. Install the required dependencies:
   ```bash
   flutter pub get
    npm install
5. Run the backend server:
    ```bash
    node server.js
6. Launch the Flutter app:
   ```bash
   flutter run
## How to Use
- Farmers can register, log in, and add products for sale, including setting the price and quantity.
- Consumers can browse products, place orders, and bid on products.
- Retailers can also browse and place bulk orders, making it easier for them to source products directly from farmers.
