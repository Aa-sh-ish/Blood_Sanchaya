# Flutter Mobile App Documentation

## Overview

The Blood Sanchaya Flutter application is a cross-platform mobile app that serves as the frontend for the blood donation management system. It provides a user-friendly interface for donors, blood banks, and administrators to interact with the system.

## App Architecture

### Entry Point
- **main.dart**: Application entry point that initializes the app, sets up Khalti payment integration, and configures the MaterialApp.

### Navigation Structure
The app uses a combination of:
- **Curved Navigation Bar**: Main navigation between core features
- **Screen Navigation**: Traditional Flutter navigation for detailed flows
- **Dialog-based Navigation**: For quick actions and confirmations

## Key Screens and Features

### 1. Splash Screen (`splash_screen.dart`)
- **Purpose**: Initial app loading screen
- **Duration**: Brief display before navigation to login/home
- **Branding**: Displays Blood Sanchaya logo and branding

### 2. Authentication Screens

#### Login Screen (`login.dart`)
- **Features**: User login with email and password
- **Validation**: Input validation and error handling
- **Navigation**: Redirects to home page on successful login
- **UI**: Gradient background with form inputs

#### Sign In Screen (`signin.dart`)
- **Features**: New user registration
- **Fields**: Email, password, phone number, address, blood group
- **Blood Group Selection**: Dropdown with all 8 blood types (A+, A-, B+, B-, O+, O-, AB+, AB-)
- **Validation**: Email format, password strength, required fields
- **UI**: Consistent gradient design with form validation

### 3. Main Dashboard (`homePage.dart`)
- **Purpose**: Central hub for user interactions
- **Features**:
  - Blood group filtering dropdown
  - Quick access to blood bank details
  - Navigation to events and help posts
  - User profile access
- **UI**: Red gradient background with card-based layout

### 4. Blood Bank Management

#### Blood Bank Details (`blood_bank_detail.dart`)
- **Features**: Comprehensive blood bank information
- **Data Display**:
  - Available blood units by type
  - Contact information
  - Location details
  - Operating hours
- **Actions**: Call, navigate, request blood

#### Bank Login (`Bank_Login.dart`)
- **Purpose**: Blood bank staff authentication
- **Features**: Secure login for blood bank administrators
- **Access**: Provides access to blood bank management features

### 5. Events and Community

#### Events Screen (`Events.dart`)
- **Purpose**: Display blood donation events
- **Features**:
  - Event listings with dates and locations
  - Event details and registration
  - Community engagement

#### Help Posts (`Help_Post.dart`)
- **Purpose**: Emergency blood requests
- **Features**:
  - Urgent blood requirement posts
  - Contact donors directly
  - Emergency response coordination

#### Event and Help (`Event and Help.dart`)
- **Purpose**: Combined view of events and help requests
- **Features**: Unified interface for community activities

### 6. Location Services

#### Google Maps Integration (`google_map.dart`)
- **Features**:
  - Display blood bank locations
  - Route planning to blood banks
  - GPS-based current location
  - Interactive map with markers
- **Dependencies**: `google_maps_flutter`, `geolocator`, `flutter_polyline_points`

### 7. Payment Integration

#### Khalti Payment (`Khalti.dart`)
- **Purpose**: Process donations and payments
- **Features**:
  - Secure payment processing
  - Multiple payment options
  - Transaction confirmation
  - Receipt generation
- **Integration**: Khalti payment gateway SDK

### 8. User Management

#### Date Update (`date_update.dart`)
- **Purpose**: Update user donation dates and availability
- **Features**:
  - Last donation date tracking
  - Next eligible donation date
  - Availability status management

#### Feedback (`feedback.dart`)
- **Purpose**: User feedback and rating system
- **Features**:
  - Rate blood bank services
  - Submit complaints or suggestions
  - User experience improvement

#### Support (`Support.dart`)
- **Purpose**: Customer support and help
- **Features**:
  - FAQ section
  - Contact support
  - Troubleshooting guides

### 9. About Sections

#### About Us (`aboutUs.dart`)
- **Purpose**: Information about the Blood Sanchaya organization
- **Features**: Mission, vision, team information

#### About Blood Sanchaya (`about_Blood_Sanchaya.dart`)
- **Purpose**: App-specific information and features
- **Features**: App functionality, usage guidelines

### 10. Navigation Components

#### Bottom Navigation (`ButtomNavi.dart`)
- **Purpose**: Main app navigation
- **Features**: Curved navigation bar with icon-based navigation

## State Management

The app uses a combination of:
- **StatefulWidget**: For screen-specific state management
- **Providers**: For shared state across the app (in `Providers/` directory)
- **Local State**: For form inputs and temporary data

## Dependencies and Packages

### Core Flutter Dependencies
- `flutter`: Flutter SDK
- `cupertino_icons`: iOS-style icons

### UI Components
- `curved_navigation_bar: ^1.0.3`: Custom navigation bar
- `dropdown_button2: ^1.9.2`: Enhanced dropdown component
- `flutter_smart_dialog: ^4.7.3`: Advanced dialog management
- `flutter_animated_dialog: ^2.0.1`: Animated dialog transitions
- `flutter_rating_bar: ^4.0.1`: Rating bar component
- `awesome_snackbar_content: ^0.0.8`: Custom snackbars

### Maps and Location
- `google_maps_flutter: ^2.2.2`: Google Maps integration
- `geolocator: ^9.0.2`: GPS and location services
- `flutter_google_places: ^0.3.0`: Google Places API
- `flutter_polyline_points: ^1.0.0`: Route drawing on maps

### Payment and Services
- `khalti: ^1.0.2`: Khalti payment gateway
- `http: ^0.13.4`: HTTP requests for API calls

### Utilities
- `intl: ^0.18.0`: Internationalization and date formatting
- `easy_splash_screen: ^1.0.4`: Splash screen implementation

## Data Models

### User Model
Located in `models/` directory, contains:
- User personal information
- Blood group and donation history
- Authentication tokens

### Blood Bank Model
- Blood bank details
- Available blood units
- Contact and location information

### Event Model
- Event details
- Date and location
- Participant information

## API Integration

The app communicates with the Node.js backend through HTTP requests:
- Base URL: `http://192.168.137.1:8848`
- Authentication: JWT tokens
- Data format: JSON

### Key API Calls
- User registration and login
- Blood bank information retrieval
- Event and help post data
- Location-based searches

## UI/UX Design Patterns

### Color Scheme
- **Primary**: Red gradient (`#EA5959` to `#F5F5F5`)
- **Background**: Transparent with gradient overlays
- **Accent**: Material Design colors for different blood types

### Typography
- Material Design typography
- Consistent font sizes and weights
- High contrast for readability

### Layout Patterns
- Card-based layouts for information display
- Gradient backgrounds for visual appeal
- Responsive design for different screen sizes
- Consistent spacing and padding

## Error Handling

### Network Errors
- Timeout handling
- Connection error messages
- Retry mechanisms

### Validation Errors
- Real-time form validation
- User-friendly error messages
- Input formatting assistance

### System Errors
- Graceful degradation
- Error reporting and logging
- User feedback for issues

## Performance Optimization

### Memory Management
- Efficient widget disposal
- Image caching strategies
- State management optimization

### Network Optimization
- Request caching
- Lazy loading for large datasets
- Optimized API calls

### UI Performance
- Smooth animations
- Efficient list rendering
- Minimal rebuilds

## Security Features

### Data Protection
- Secure API communication
- Local data encryption
- User privacy protection

### Authentication Security
- JWT token management
- Secure password handling
- Session management

## Testing Strategy

### Unit Tests
- Widget testing
- Business logic testing
- Model validation

### Integration Tests
- API integration testing
- End-to-end user flows
- Performance testing

## Platform-Specific Features

### Android
- Material Design compliance
- Android-specific permissions
- Native integration where needed

### iOS
- Cupertino design elements
- iOS-specific permissions
- App Store compliance

### Web (if applicable)
- Responsive web design
- Browser compatibility
- Web-specific optimizations

## Future Enhancements

### Planned Features
- Push notifications for emergency requests
- Offline mode support
- Advanced search and filtering
- Social media integration
- Multi-language support

### Technical Improvements
- State management upgrade (Provider/Riverpod)
- Advanced caching strategies
- Performance monitoring
- Automated testing pipeline
