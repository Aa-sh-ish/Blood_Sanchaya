# Blood Sanchaya

A comprehensive blood donation management system that connects donors with blood banks and facilitates blood donation tracking and management.

## Overview

Blood Sanchaya is a full-stack application consisting of a Flutter mobile application and Node.js backend server. The platform aims to streamline the blood donation process by providing:

- **For Donors**: Easy registration, blood bank location finding, donation tracking
- **For Blood Banks**: Donor management, blood inventory tracking, event organization
- **For Everyone**: Emergency blood requests, donation events, awareness campaigns

## Features

### Mobile App (Flutter)
- **User Authentication**: Secure registration and login system
- **Blood Group Filtering**: Find donors and blood banks by blood type
- **Location Services**: Google Maps integration for finding nearby blood banks
- **Blood Bank Details**: Comprehensive information about blood banks
- **Events & Help Posts**: Community-driven donation events and emergency requests
- **Payment Integration**: Khalti payment gateway for donations
- **Real-time Updates**: Live blood availability status
- **User Profiles**: Personal donation history and settings

### Backend Server (Node.js)
- **RESTful API**: Complete API for mobile app integration
- **User Management**: Donor and admin authentication
- **Blood Status Tracking**: Real-time inventory management
- **Secure Authentication**: JWT tokens and bcrypt password hashing
- **MongoDB Database**: Scalable data storage
- **Admin Dashboard**: Blood bank management interface

## Technology Stack

### Frontend (Flutter)
- Flutter SDK
- Dart programming language
- Google Maps Flutter
- Khalti Payment SDK
- Geolocator for GPS
- Curved Navigation Bar
- Smart Dialog for UI

### Backend (Node.js)
- Express.js framework
- MongoDB with Mongoose ODM
- JWT for authentication
- bcrypt for password hashing
- dotenv for environment variables
- Morgan for logging

## Quick Start

### Prerequisites
- Flutter SDK (>=2.17.1)
- Node.js (>=14.0.0)
- MongoDB
- Git

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Blood_Sanchaya
   ```

2. **Backend Setup**
   ```bash
   cd Server
   npm install
   npm start
   ```
   The server will run on `http://192.168.137.1:8848`

3. **Flutter App Setup**
   ```bash
   cd ..
   flutter pub get
   flutter run
   ```

4. **Environment Configuration**
   - Create `.env` file in Server directory
   - Configure MongoDB connection string
   - Set up Khalti payment credentials

## Project Structure

```
Blood_Sanchaya/
|
|-- lib/                    # Flutter mobile app
|   |-- main.dart          # App entry point
|   |-- homePage.dart      # Main dashboard
|   |-- signin.dart        # User registration
|   |-- login.dart         # User login
|   |-- blood_bank_detail.dart
|   |-- Events.dart
|   |-- google_map.dart
|   |-- Khalti.dart
|   |-- models/            # Data models
|   |-- services/          # API services
|   |-- utils/             # Utility functions
|   |-- Providers/         # State management
|
|-- Server/                # Node.js backend
|   |-- app.js            # Server entry point
|   |-- Models/           # Database models
|   |-- routes/           # API routes
|   |-- views/            # Rendered views
|   |-- public/           # Static files
|
|-- android/              # Android-specific files
|-- ios/                  # iOS-specific files
|-- web/                  # Web build files
|-- assets/               # App assets and images
```

## API Endpoints

### Authentication
- `POST /signin` - User registration
- `POST /login` - User login
- `POST /adminSignin` - Admin registration
- `POST /adminLogin` - Admin login

### Blood Management
- `GET /filter_blood` - Filter by blood group
- `GET /bloodStatus` - Get blood availability status

### User Management
- `GET /users` - Get user information
- `GET /` - Root endpoint

## Database Schema

### User Model
```javascript
{
  email: String (required, validated),
  password: String (required, hashed),
  phoneNumber: Number (required),
  address: String (required),
  bloodGroup: String (required)
}
```

### Blood Status Model
```javascript
{
  "A+": { status: Number, Plasma: Number, platelets: Number },
  "A-": { status: Number, Plasma: Number, platelets: Number },
  "B+": { status: Number, Plasma: Number, platelets: Number },
  "B-": { status: Number, Plasma: Number, platelets: Number },
  "AB+": { status: Number, Plasma: Number, platelets: Number },
  "AB-": { status: Number, Plasma: Number, platelets: Number },
  "O+": { status: Number, Plasma: Number, platelets: Number },
  "O-": { status: Number, Plasma: Number, platelets: Number }
}
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For support and questions, please contact the development team or open an issue in the repository.

---

**Note**: This is a blood donation management system designed to save lives. Please ensure all medical information is accurate and up-to-date.
