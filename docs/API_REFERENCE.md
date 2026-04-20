# API Reference Documentation

## Overview

This document provides comprehensive documentation for all API endpoints available in the Blood Sanchaya backend server. The API follows RESTful conventions and uses JSON for data exchange.

## Base Information

- **Base URL**: `http://192.168.137.1:8848`
- **Content-Type**: `application/json`
- **Authentication**: JWT tokens (for protected endpoints)
- **Database**: MongoDB with Mongoose ODM

## Authentication Endpoints

### POST /signin
Register a new user/donor account.

**Endpoint**: `POST /signin`

**Description**: Creates a new user account with email, password, phone number, address, and blood group.

**Request Headers**:
```
Content-Type: application/json
```

**Request Body**:
```json
{
  "email": "donor@example.com",
  "password": "SecurePass123!",
  "phoneNumber": 9876543210,
  "address": "Kathmandu, Nepal",
  "bloodGroup": "O+"
}
```

**Request Validation**:
- `email`: Required, valid email format
- `password`: Required, 8-15 characters, at least 1 digit, at least 1 special character
- `phoneNumber`: Required, numeric value
- `address`: Required, string
- `bloodGroup`: Required, one of ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"]

**Success Response** (201 Created):
```json
{
  "_id": "63f8a1b2c3d4e5f6a7b8c9d0",
  "email": "donor@example.com",
  "phoneNumber": 9876543210,
  "address": "Kathmandu, Nepal",
  "bloodGroup": "O+",
  "createdAt": "2023-02-24T10:30:00.000Z",
  "__v": 0
}
```

**Error Responses**:
- `400 Bad Request`: Validation errors or missing fields
  ```json
  {
    "message": "Please Enter a valid Email Address"
  }
  ```
- `400 Bad Request`: Account already exists
  ```json
  {
    "message": "Account already exist"
  }
  ```
- `500 Internal Server Error`: Database error
  ```json
  {
    "error": "Database connection failed"
  }
  ```

**Example Usage**:
```bash
curl -X POST http://192.168.137.1:8848/signin \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john.doe@example.com",
    "password": "BloodDonor123!",
    "phoneNumber": 1234567890,
    "address": "Patan, Nepal",
    "bloodGroup": "A+"
  }'
```

### POST /login
Authenticate an existing user.

**Endpoint**: `POST /login`

**Description**: Authenticates a user with email and password, returns user data and authentication token.

**Request Headers**:
```
Content-Type: application/json
```

**Request Body**:
```json
{
  "email": "donor@example.com",
  "password": "SecurePass123!"
}
```

**Success Response** (200 OK):
```json
{
  "_id": "63f8a1b2c3d4e5f6a7b8c9d0",
  "email": "donor@example.com",
  "phoneNumber": 9876543210,
  "address": "Kathmandu, Nepal",
  "bloodGroup": "O+",
  "createdAt": "2023-02-24T10:30:00.000Z",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Error Responses**:
- `400 Bad Request`: Invalid credentials
  ```json
  {
    "message": "Invalid email or password"
  }
  ```
- `404 Not Found`: User not found
  ```json
  {
    "message": "User not found"
  }
  ```

**Example Usage**:
```bash
curl -X POST http://192.168.137.1:8848/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john.doe@example.com",
    "password": "BloodDonor123!"
  }'
```

### POST /adminSignin
Register a new admin account.

**Endpoint**: `POST /adminSignin`

**Description**: Creates a new administrator account for blood bank management.

**Request Body**:
```json
{
  "email": "admin@bloodbank.com",
  "password": "AdminPass123!",
  "phoneNumber": 9876543211,
  "address": "Blood Bank Office",
  "bloodGroup": "AB+"
}
```

**Success Response** (201 Created):
```json
{
  "_id": "63f8a1b2c3d4e5f6a7b8c9d1",
  "email": "admin@bloodbank.com",
  "phoneNumber": 9876543211,
  "address": "Blood Bank Office",
  "bloodGroup": "AB+",
  "role": "admin",
  "createdAt": "2023-02-24T10:35:00.000Z"
}
```

### POST /adminLogin
Authenticate an admin user.

**Endpoint**: `POST /adminLogin`

**Description**: Authenticates an administrator with email and password.

**Request Body**:
```json
{
  "email": "admin@bloodbank.com",
  "password": "AdminPass123!"
}
```

**Success Response** (200 OK):
```json
{
  "_id": "63f8a1b2c3d4e5f6a7b8c9d1",
  "email": "admin@bloodbank.com",
  "phoneNumber": 9876543211,
  "address": "Blood Bank Office",
  "bloodGroup": "AB+",
  "role": "admin",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

## Blood Management Endpoints

### GET /filter_blood
Filter users or blood banks by blood group.

**Endpoint**: `GET /filter_blood`

**Description**: Retrieves a list of users or blood banks filtered by blood group.

**Query Parameters**:
- `bloodGroup` (optional): Blood group to filter by (A+, A-, B+, B-, O+, O-, AB+, AB-)
- `type` (optional): Filter type ("donors" or "banks")

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": [
    {
      "_id": "63f8a1b2c3d4e5f6a7b8c9d0",
      "email": "donor@example.com",
      "phoneNumber": 9876543210,
      "address": "Kathmandu, Nepal",
      "bloodGroup": "O+",
      "availability": true,
      "lastDonation": "2023-01-15T00:00:00.000Z"
    }
  ],
  "count": 1
}
```

**Example Usage**:
```bash
# Filter O+ blood group donors
curl -X GET "http://192.168.137.1:8848/filter_blood?bloodGroup=O+&type=donors"

# Filter all blood banks
curl -X GET "http://192.168.137.1:8848/filter_blood?type=banks"
```

### GET /bloodStatus
Get current blood availability status.

**Endpoint**: `GET /bloodStatus`

**Description**: Retrieves the current availability status for all blood groups including plasma and platelets.

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "_id": "63f8a1b2c3d4e5f6a7b8c9d2",
    "A+": {
      "status": 10,
      "Plasma": 5,
      "platelets": 3
    },
    "A-": {
      "status": 5,
      "Plasma": 2,
      "platelets": 1
    },
    "B+": {
      "status": 8,
      "Plasma": 4,
      "platelets": 2
    },
    "B-": {
      "status": 3,
      "Plasma": 1,
      "platelets": 0
    },
    "AB+": {
      "status": 6,
      "Plasma": 3,
      "platelets": 2
    },
    "AB-": {
      "status": 2,
      "Plasma": 1,
      "platelets": 0
    },
    "O+": {
      "status": 15,
      "Plasma": 8,
      "platelets": 5
    },
    "O-": {
      "status": 4,
      "Plasma": 2,
      "platelets": 1
    },
    "lastUpdated": "2023-02-24T12:00:00.000Z"
  }
}
```

**Example Usage**:
```bash
curl -X GET http://192.168.137.1:8848/bloodStatus
```

### POST /bloodStatus
Update blood availability status (admin only).

**Endpoint**: `POST /bloodStatus`

**Description**: Updates the availability status for specific blood groups. Requires admin authentication.

**Request Headers**:
```
Content-Type: application/json
Authorization: Bearer <admin_token>
```

**Request Body**:
```json
{
  "A+": {
    "status": 12,
    "Plasma": 6,
    "platelets": 4
  },
  "O+": {
    "status": 18,
    "Plasma": 10,
    "platelets": 6
  }
}
```

**Success Response** (200 OK):
```json
{
  "success": true,
  "message": "Blood status updated successfully",
  "data": {
    "A+": {
      "status": 12,
      "Plasma": 6,
      "platelets": 4
    },
    "O+": {
      "status": 18,
      "Plasma": 10,
      "platelets": 6
    }
  }
}
```

**Error Responses**:
- `401 Unauthorized`: Invalid or missing admin token
- `403 Forbidden`: Insufficient permissions

## User Management Endpoints

### GET /users
Get user information (admin only).

**Endpoint**: `GET /users`

**Description**: Retrieves a list of all users in the system. Requires admin authentication.

**Request Headers**:
```
Authorization: Bearer <admin_token>
```

**Query Parameters**:
- `page` (optional): Page number for pagination (default: 1)
- `limit` (optional): Number of users per page (default: 10)
- `bloodGroup` (optional): Filter by blood group

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": [
    {
      "_id": "63f8a1b2c3d4e5f6a7b8c9d0",
      "email": "donor@example.com",
      "phoneNumber": 9876543210,
      "address": "Kathmandu, Nepal",
      "bloodGroup": "O+",
      "createdAt": "2023-02-24T10:30:00.000Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 10,
    "total": 1,
    "pages": 1
  }
}
```

**Example Usage**:
```bash
curl -X GET "http://192.168.137.1:8848/users?page=1&limit=20&bloodGroup=O+" \
  -H "Authorization: Bearer <admin_token>"
```

### GET /users/:id
Get specific user details.

**Endpoint**: `GET /users/:id`

**Description**: Retrieves detailed information for a specific user by ID.

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "_id": "63f8a1b2c3d4e5f6a7b8c9d0",
    "email": "donor@example.com",
    "phoneNumber": 9876543210,
    "address": "Kathmandu, Nepal",
    "bloodGroup": "O+",
    "donationHistory": [
      {
        "date": "2023-01-15T00:00:00.000Z",
        "location": "Central Blood Bank",
        "units": 1
      }
    ],
    "createdAt": "2023-02-24T10:30:00.000Z"
  }
}
```

## Blood Bank Management Endpoints

### GET /getBBDetails
Get blood bank details.

**Endpoint**: `GET /getBBDetails`

**Description**: Retrieves information about available blood banks.

**Query Parameters**:
- `location` (optional): Filter by location
- `id` (optional): Get specific blood bank by ID

**Success Response** (200 OK):
```json
{
  "success": true,
  "data": [
    {
      "_id": "63f8a1b2c3d4e5f6a7b8c9d3",
      "name": "Central Blood Bank",
      "address": "Kathmandu, Nepal",
      "phoneNumber": 9876543212,
      "email": "central@bloodbank.com",
      "coordinates": {
        "latitude": 27.7061,
        "longitude": 85.3301
      },
      "operatingHours": {
        "monday": "9:00 AM - 5:00 PM",
        "tuesday": "9:00 AM - 5:00 PM",
        "wednesday": "9:00 AM - 5:00 PM",
        "thursday": "9:00 AM - 5:00 PM",
        "friday": "9:00 AM - 5:00 PM",
        "saturday": "9:00 AM - 1:00 PM",
        "sunday": "Closed"
      },
      "services": [
        "Blood Donation",
        "Plasma Donation",
        "Platelet Donation",
        "Emergency Services"
      ]
    }
  ]
}
```

**Example Usage**:
```bash
# Get all blood banks
curl -X GET http://192.168.137.1:8848/getBBDetails

# Get blood banks in specific location
curl -X GET "http://192.168.137.1:8848/getBBDetails?location=Kathmandu"

# Get specific blood bank
curl -X GET "http://192.168.137.1:8848/getBBDetails?id=63f8a1b2c3d4e5f6a7b8c9d3"
```

## Utility Endpoints

### GET /
Server health check.

**Endpoint**: `GET /`

**Description**: Returns server status and basic information.

**Success Response** (200 OK):
```json
{
  "success": true,
  "message": "Blood Sanchaya API Server",
  "version": "1.0.0",
  "status": "running",
  "timestamp": "2023-02-24T12:30:00.000Z",
  "environment": "development"
}
```

**Example Usage**:
```bash
curl -X GET http://192.168.137.1:8848/
```

## Error Handling

### Standard Error Response Format
```json
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable error message",
    "details": "Additional error details (if available)"
  }
}
```

### Common Error Codes

| Status Code | Error Type | Description |
|-------------|------------|-------------|
| 400 | Bad Request | Invalid request parameters or validation errors |
| 401 | Unauthorized | Authentication required or invalid credentials |
| 403 | Forbidden | Insufficient permissions for requested action |
| 404 | Not Found | Resource not found |
| 500 | Internal Server Error | Server-side error occurred |

### Validation Error Examples

**Email Validation Error**:
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Please Enter a valid Email Address",
    "field": "email"
  }
}
```

**Password Validation Error**:
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Password must contain 8 characters",
    "field": "password"
  }
}
```

## Rate Limiting

The API implements rate limiting to prevent abuse:

- **General Endpoints**: 100 requests per minute per IP
- **Authentication Endpoints**: 10 requests per minute per IP
- **Admin Endpoints**: 50 requests per minute per authenticated admin

**Rate Limit Response** (429 Too Many Requests):
```json
{
  "success": false,
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Too many requests. Please try again later.",
    "retryAfter": 60
  }
}
```

## Authentication

### JWT Token Structure
```json
{
  "header": {
    "alg": "HS256",
    "typ": "JWT"
  },
  "payload": {
    "sub": "user_id",
    "email": "user@example.com",
    "role": "user",
    "iat": 1677264600,
    "exp": 1677870600
  }
}
```

### Using Authentication Tokens
Include the JWT token in the Authorization header for protected endpoints:

```
Authorization: Bearer <your_jwt_token>
```

**Example**:
```bash
curl -X GET http://192.168.137.1:8848/users \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
```

## Testing Examples

### Complete User Registration and Login Flow

**1. Register New User**:
```bash
curl -X POST http://192.168.137.1:8848/signin \
  -H "Content-Type: application/json" \
  -d '{
    "email": "testuser@example.com",
    "password": "TestPass123!",
    "phoneNumber": 1234567890,
    "address": "Test Address",
    "bloodGroup": "A+"
  }'
```

**2. Login User**:
```bash
curl -X POST http://192.168.137.1:8848/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "testuser@example.com",
    "password": "TestPass123!"
  }'
```

**3. Check Blood Status**:
```bash
curl -X GET http://192.168.137.1:8848/bloodStatus
```

**4. Filter Donors by Blood Group**:
```bash
curl -X GET "http://192.168.137.1:8848/filter_blood?bloodGroup=A+&type=donors"
```

### Admin Operations Flow

**1. Register Admin**:
```bash
curl -X POST http://192.168.137.1:8848/adminSignin \
  -H "Content-Type: application/json" \
  -d '{
    "email": "admin@test.com",
    "password": "AdminPass123!",
    "phoneNumber": 9876543211,
    "address": "Admin Office",
    "bloodGroup": "O+"
  }'
```

**2. Login Admin**:
```bash
curl -X POST http://192.168.137.1:8848/adminLogin \
  -H "Content-Type: application/json" \
  -d '{
    "email": "admin@test.com",
    "password": "AdminPass123!"
  }'
```

**3. Update Blood Status** (using admin token):
```bash
curl -X POST http://192.168.137.1:8848/bloodStatus \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <admin_token>" \
  -d '{
    "A+": {
      "status": 20,
      "Plasma": 10,
      "platelets": 5
    }
  }'
```

## SDK Integration Examples

### JavaScript/Node.js
```javascript
const axios = require('axios');

const api = axios.create({
  baseURL: 'http://192.168.137.1:8848',
  headers: {
    'Content-Type': 'application/json'
  }
});

// User registration
const registerUser = async (userData) => {
  try {
    const response = await api.post('/signin', userData);
    return response.data;
  } catch (error) {
    console.error('Registration failed:', error.response.data);
  }
};

// User login
const loginUser = async (credentials) => {
  try {
    const response = await api.post('/login', credentials);
    return response.data;
  } catch (error) {
    console.error('Login failed:', error.response.data);
  }
};
```

### Python
```python
import requests

base_url = 'http://192.168.137.1:8848'

def register_user(userData):
    response = requests.post(f'{base_url}/signin', json=userData)
    return response.json()

def login_user(credentials):
    response = requests.post(f'{base_url}/login', json=credentials)
    return response.json()

def get_blood_status():
    response = requests.get(f'{base_url}/bloodStatus')
    return response.json()
```

### Flutter/Dart
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class BloodSanchayaAPI {
  final String baseUrl = 'http://192.168.137.1:8848';

  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signin'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userData),
    );
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> loginUser(Map<String, dynamic> credentials) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(credentials),
    );
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> getBloodStatus() async {
    final response = await http.get(Uri.parse('$baseUrl/bloodStatus'));
    return json.decode(response.body);
  }
}
```

## WebSocket Integration (Future Enhancement)

Planned WebSocket endpoints for real-time updates:

### WebSocket Connection
```
ws://192.168.137.1:8848/ws
```

### Real-time Events
- Blood status updates
- Emergency blood requests
- Donation event notifications
- User availability changes

**Message Format**:
```json
{
  "type": "blood_status_update",
  "data": {
    "bloodGroup": "O+",
    "status": 15,
    "timestamp": "2023-02-24T12:30:00.000Z"
  }
}
```

This comprehensive API reference provides all the information needed to integrate with the Blood Sanchaya backend system effectively.
