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


### User Flow diagram:

![image](https://github.com/user-attachments/assets/75bfbe05-5328-4c83-a5f3-bd5f428391c8)
This diagram provides an overview of how different types of users (farmers, consumers, and retailers) interact with the KrishiConnect app. The flow starts with user registration, followed by selecting a user role (farmer, consumer, or retailer). Depending on the role, the user can either add products, browse products, place orders, bid on products, or manage bulk orders. This simplifies the overall app experience and illustrates how KrishiConnect facilitates direct sales.

### High Level System Design
![image](https://github.com/user-attachments/assets/cdc38f6b-aee6-4a68-87a1-c70e1e2e7b7a)
The system design diagram illustrates the architecture of KrishiConnect. It showcases the main components involved:

Frontend (Flutter App): The user interface where farmers, consumers, and retailers interact with the app.
Backend (Node.js): Manages the business logic, user interactions, and product transactions.
MongoDB Database: Stores product data and order information.
Wit.ai and Google Translate API: Used for speech-to-text functionality and multilingual form input, respectively, enabling seamless communication for farmers.

### Sequence Diagram
![image](https://github.com/user-attachments/assets/e5cbb0cd-52a5-4a2f-9166-0733691134fd)
This diagram shows the detailed flow of a consumer placing an order within the app. It starts with the consumer browsing products, selecting a product, and placing an order. The app then communicates with the backend to store the order in the database and confirms the order back to the consumer. This demonstrates the step-by-step interaction between the consumer, app, backend, and database for managing orders.



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
