# Backend API Documentation

## Overview

The Blood Sanchaya backend is a Node.js RESTful API server that provides data management and authentication services for the Flutter mobile application. It uses Express.js framework with MongoDB database for data persistence.

## Server Configuration

### Entry Point (`app.js`)
- **Framework**: Express.js
- **Database**: MongoDB with Mongoose ODM
- **Port**: 8848
- **Host**: 192.168.137.1
- **Environment**: Development (with debugging enabled)

### Database Connection
```javascript
// Primary connection (local)
mongoose.connect("mongodb://0.0.0.0:27017/Blood_sanchaya")

// Alternative connection (MongoDB Atlas)
const db = "mongodb+srv://Blood_Sanchaya:Blood_Sanchaya@cluster0.lamnncx.mongodb.net/bood_sanchaya";
```

### Middleware Configuration
- **Morgan**: HTTP request logging
- **Express JSON**: Body parsing for JSON requests
- **Express URL-encoded**: Form data parsing
- **Cookie Parser**: Cookie handling
- **Static Files**: Public directory serving
- **Custom Middleware**: Request logging

## Database Models

### User Model (`Models/UserModel.js`)

**Schema Definition:**
```javascript
const userSchema = {
    email: {
        type: String,
        required: true,
        validate: {
            validator: (value) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: "Please Enter a valid Email Address"
        }
    },
    password: {
        type: String,
        required: true,
        passwordValidator: {
            min: 8, "Password must contain 8 characters",
            digits: 1, "Must contain atleast 1 digits",
            symbols: 1, "Must contain atleast 1 special characters",
            max: 15, "Password lenght must not exceed 15 characters"
        }
    },
    phoneNumber: {
        type: Number,
        required: true
    },
    address: {
        type: String,
        required: true
    },
    bloodGroup: {
        type: String,
        required: true
    }
}
```

**Validation Features:**
- Email format validation with regex
- Password strength validation (8-15 chars, 1 digit, 1 symbol)
- Required field validation
- Custom error messages

### Blood Status Model (`Models/bloodStatusModel.js`)

**Schema Definition:**
```javascript
const bloodStatusSchema = {
    "A+": {
        status: { type: Number, default: 0, required: true },
        Plasma: { type: Number, default: 1, required: true },
        platelets: { type: Number, default: 0, required: true }
    },
    "A-": {
        status: { type: Number, default: 0, required: true },
        Plasma: { type: Number, default: 1, required: true },
        platelets: { type: Number, default: 0, required: true }
    },
    "B+": {
        status: { type: Number, default: 0, required: true },
        Plasma: { type: Number, default: 1, required: true },
        platelets: { type: Number, default: 0, required: true }
    },
    "B-": {
        status: { type: Number, default: 0, required: true },
        Plasma: { type: Number, default: 1, required: true },
        platelets: { type: Number, default: 0, required: true }
    },
    "AB+": {
        status: { type: Number, default: 0, required: true },
        Plasma: { type: Number, default: 1, required: true },
        platelets: { type: Number, default: 0, required: true }
    },
    "AB-": {
        status: { type: Number, default: 0, required: true },
        Plasma: { type: Number, default: 1, required: true },
        platelets: { type: Number, default: 0, required: true }
    },
    "O+": {
        status: { type: Number, default: 0, required: true },
        Plasma: { type: Number, default: 1, required: true },
        platelets: { type: Number, default: 0, required: true }
    },
    "O-": {
        status: { type: Number, default: 0, required: true },
        Plasma: { type: Number, default: 1, required: true },
        platelets: { type: Number, default: 0, required: true }
    }
}
```

**Blood Component Tracking:**
- **Status**: General availability status
- **Plasma**: Plasma units available
- **Platelets**: Platelet units available

### Admin Model (`Models/AdminModel.js`)
Administrative user management for blood bank operations.

## API Routes

### Authentication Routes

#### User Registration (`/signin`)
- **Method**: POST
- **Purpose**: Register new user/donor
- **Request Body**:
  ```json
  {
    "email": "user@example.com",
    "password": "password123",
    "phoneNumber": 1234567890,
    "address": "User Address",
    "bloodGroup": "A+"
  }
  ```
- **Response**:
  ```json
  {
    "_id": "user_id",
    "email": "user@example.com",
    "phoneNumber": 1234567890,
    "address": "User Address",
    "bloodGroup": "A+",
    "createdAt": "2023-01-01T00:00:00.000Z"
  }
  ```
- **Validation**: Email uniqueness check, password hashing with bcrypt

#### User Login (`/login`)
- **Method**: POST
- **Purpose**: Authenticate existing user
- **Request Body**:
  ```json
  {
    "email": "user@example.com",
    "password": "password123"
  }
  ```
- **Response**: User data with authentication token
- **Security**: Password verification with bcrypt comparison

#### Admin Registration (`/adminSignin`)
- **Method**: POST
- **Purpose**: Register new admin user
- **Features**: Admin-specific validation and permissions

#### Admin Login (`/adminLogin`)
- **Method**: POST
- **Purpose**: Authenticate admin users
- **Features**: Admin dashboard access

### Blood Management Routes

#### Blood Group Filtering (`/filter_blood`)
- **Method**: GET
- **Purpose**: Filter users/blood banks by blood group
- **Query Parameters**: bloodGroup
- **Response**: Filtered list of donors or blood banks

#### Blood Status Management (`/bloodStatus`)
- **Method**: GET/POST
- **Purpose**: Manage blood availability status
- **Response**: Current blood inventory levels
- **Features**: Real-time status updates

### Utility Routes

#### Root Endpoint (`/`)
- **Method**: GET
- **Purpose**: Server health check
- **Response**: Server status and basic information

#### Users Endpoint (`/users`)
- **Method**: GET
- **Purpose**: User management endpoint
- **Features**: Admin access to user data

#### Blood Bank Details (`/getBBDetails`)
- **Method**: GET
- **Purpose**: Retrieve blood bank information
- **Response**: Blood bank details and availability

## Security Implementation

### Password Security
- **Hashing**: bcrypt with salt rounds (8)
- **Validation**: Password strength requirements
- **Storage**: Only hashed passwords stored in database

### Authentication
- **JWT Tokens**: For session management
- **Middleware**: Route protection for admin endpoints
- **Session Management**: Secure token handling

### Input Validation
- **Email Validation**: Regex pattern matching
- **Password Validation**: Custom validator with multiple criteria
- **Required Fields**: Mongoose schema validation
- **Data Sanitization**: Protection against injection attacks

## Error Handling

### Global Error Handler
```javascript
app.use(function(err, req, res, next) {
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
  res.status(err.status || 500);
  res.render('error');
});
```

### 404 Handler
```javascript
app.use(function(req, res, next) {
  next(createError(404));
});
```

### Custom Error Responses
- **400**: Bad Request (validation errors)
- **401**: Unauthorized (authentication failures)
- **404**: Not Found (missing resources)
- **500**: Internal Server Error

## Development Configuration

### Package Dependencies
```json
{
  "dependencies": {
    "bcrypt": "^5.1.0",
    "cookie-parser": "~1.4.4",
    "debug": "~2.6.9",
    "dotenv": "^16.0.3",
    "express": "~4.16.1",
    "http-errors": "~1.6.3",
    "jade": "~1.11.0",
    "jsonwebtoken": "^9.0.0",
    "mongoose": "^6.9.0",
    "morgan": "~1.9.1",
    "password-validator": "^5.3.0",
    "validator": "^13.7.0"
  },
  "devDependencies": {
    "nodemon": "^2.0.20"
  }
}
```

### Development Scripts
- **Start**: `npm start` (uses nodemon for auto-restart)
- **Environment**: Development mode with debugging

### Environment Variables
- Database connection strings
- JWT secret keys
- Server configuration
- Third-party API keys

## Data Flow Architecture

### Request Processing
1. **Middleware Chain**: Request passes through configured middleware
2. **Route Matching**: Appropriate route handler selected
3. **Validation**: Input validation and sanitization
4. **Business Logic**: Core processing and database operations
5. **Response**: Formatted JSON response with appropriate status

### Database Operations
- **CRUD Operations**: Create, Read, Update, Delete
- **Query Optimization**: Efficient MongoDB queries
- **Data Validation**: Schema-level validation
- **Error Handling**: Database error management

## API Usage Examples

### User Registration Flow
```bash
curl -X POST http://192.168.137.1:8848/signin \
  -H "Content-Type: application/json" \
  -d '{
    "email": "donor@example.com",
    "password": "SecurePass123!",
    "phoneNumber": 9876543210,
    "address": "Kathmandu, Nepal",
    "bloodGroup": "O+"
  }'
```

### Blood Group Filtering
```bash
curl -X GET "http://192.168.137.1:8848/filter_blood?bloodGroup=O+"
```

### Blood Status Check
```bash
curl -X GET http://192.168.137.1:8848/bloodStatus
```

## Performance Considerations

### Database Optimization
- **Indexing**: Strategic field indexing for query performance
- **Connection Pooling**: Efficient database connection management
- **Query Optimization**: Reduced database calls and efficient queries

### Caching Strategy
- **In-memory Caching**: Frequently accessed data
- **Response Caching**: API response caching where appropriate
- **Database Caching**: Query result caching

### Scalability Features
- **Horizontal Scaling**: Load balancing capability
- **Database Sharding**: Potential for database distribution
- **Microservices Ready**: Modular architecture for future scaling

## Monitoring and Logging

### Request Logging
- **Morgan**: HTTP request logging
- **Custom Middleware**: Request/response tracking
- **Error Logging**: Comprehensive error tracking

### Performance Monitoring
- **Response Time**: API response time tracking
- **Database Performance**: Query execution monitoring
- **Memory Usage**: Server resource monitoring

## Deployment Considerations

### Production Environment
- **Environment Variables**: Secure configuration management
- **Database Security**: Production database configuration
- **SSL/TLS**: HTTPS implementation
- **Rate Limiting**: API rate limiting for protection

### Backup Strategy
- **Database Backups**: Regular automated backups
- **Configuration Backups**: Server configuration backup
- **Disaster Recovery**: Recovery procedures and testing

## Future Enhancements

### Planned Features
- **API Versioning**: Versioned API endpoints
- **GraphQL Support**: GraphQL API alternative
- **Real-time Updates**: WebSocket integration
- **Advanced Analytics**: Usage analytics and reporting

### Technical Improvements
- **Containerization**: Docker deployment
- **CI/CD Pipeline**: Automated testing and deployment
- **API Documentation**: Swagger/OpenAPI integration
- **Enhanced Security**: Advanced security measures
