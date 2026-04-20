# Setup and Deployment Guide

## Overview

This guide provides comprehensive instructions for setting up and deploying the Blood Sanchaya blood donation management system. The system consists of a Flutter mobile application and a Node.js backend server with MongoDB database.

## Prerequisites

### System Requirements

#### Development Machine
- **Operating System**: Windows 10/11, macOS 10.14+, or Linux (Ubuntu 18.04+)
- **RAM**: Minimum 8GB (16GB recommended)
- **Storage**: Minimum 10GB free space
- **Internet Connection**: Required for package downloads and API calls

#### Software Requirements
- **Node.js**: Version 14.0.0 or higher
- **npm**: Version 6.0.0 or higher (comes with Node.js)
- **Flutter SDK**: Version 2.17.1 or higher
- **MongoDB**: Version 4.4 or higher
- **Git**: For version control
- **Code Editor**: VS Code, Android Studio, or similar

#### Mobile Development (Optional)
- **Android Studio**: For Android development and emulator
- **Xcode**: For iOS development (macOS only)
- **Android SDK**: For Android builds
- **iOS Simulator**: For iOS testing (macOS only)

## Installation Guide

### 1. Flutter SDK Setup

#### Windows
1. Download Flutter SDK from [flutter.dev](https://flutter.dev/docs/get-started/install/windows)
2. Extract to `C:\flutter` (or preferred location)
3. Add Flutter to PATH:
   ```cmd
   set PATH=%PATH%;C:\flutter\bin
   ```
4. Run Flutter doctor:
   ```cmd
   flutter doctor
   ```

#### macOS
1. Install via Homebrew:
   ```bash
   brew install --cask flutter
   ```
2. Or download from flutter.dev and extract
3. Add to PATH in `.zshrc` or `.bash_profile`:
   ```bash
   export PATH="$PATH:/path/to/flutter/bin"
   ```
4. Run Flutter doctor:
   ```bash
   flutter doctor
   ```

#### Linux (Ubuntu)
1. Download Flutter SDK from flutter.dev
2. Extract and add to PATH:
   ```bash
   sudo snap install flutter --classic
   # OR manual extraction
   export PATH="$PATH:/path/to/flutter/bin"
   ```
3. Install dependencies:
   ```bash
   sudo apt update
   sudo apt install curl git unzip xz-utils zip libglu1-mesa
   ```

### 2. Node.js and npm Setup

#### Windows
1. Download from [nodejs.org](https://nodejs.org/)
2. Run installer (includes npm)
3. Verify installation:
   ```cmd
   node --version
   npm --version
   ```

#### macOS
1. Install via Homebrew:
   ```bash
   brew install node
   ```
2. Or download from nodejs.org

#### Linux
```bash
# Using Ubuntu package manager
sudo apt update
sudo apt install nodejs npm

# Or using NodeSource (recommended)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### 3. MongoDB Setup

#### Windows
1. Download MongoDB Community Server from [mongodb.com](https://www.mongodb.com/try/download/community)
2. Run installer with default settings
3. Install MongoDB Compass (optional GUI)
4. Start MongoDB service:
   ```cmd
   net start MongoDB
   ```

#### macOS
```bash
# Using Homebrew
brew tap mongodb/brew
brew install mongodb-community
brew services start mongodb-community

# Or download from mongodb.com
```

#### Linux
```bash
# Ubuntu/Debian
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# Start MongoDB
sudo systemctl start mongod
sudo systemctl enable mongod
```

## Project Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd Blood_Sanchaya
```

### 2. Backend Server Setup

#### Navigate to Server Directory
```bash
cd Server
```

#### Install Dependencies
```bash
npm install
```

#### Environment Configuration
Create `.env` file in the Server directory:
```env
# Database Configuration
MONGODB_URI=mongodb://localhost:27017/Blood_sanchaya
# Alternative: MongoDB Atlas
# MONGODB_URI=mongodb+srv://Blood_Sanchaya:Blood_Sanchaya@cluster0.lamnncx.mongodb.net/bood_sanchaya

# Server Configuration
PORT=8848
HOST=192.168.137.1

# JWT Configuration
JWT_SECRET=your_jwt_secret_key_here
JWT_EXPIRE=7d

# Khalti Payment Configuration (if applicable)
KHALTI_PUBLIC_KEY=test_public_key_158e96969237452c9be5e153dcbc391c
KHALTI_SECRET_KEY=your_khalti_secret_key

# Environment
NODE_ENV=development
```

#### Database Initialization
```bash
# Start MongoDB (if not already running)
# Windows: net start MongoDB
# macOS: brew services start mongodb-community
# Linux: sudo systemctl start mongod

# Optional: Create initial database and collections
mongosh Blood_sanchaya
```

#### Start the Server
```bash
# Development mode with auto-restart
npm start

# Or directly with node
node app.js
```

The server should start on `http://192.168.137.1:8848`

### 3. Flutter App Setup

#### Navigate to Project Root
```bash
cd ..
```

#### Install Dependencies
```bash
flutter pub get
```

#### Configure Khalti Payment
Update `lib/main.dart` with your Khalti credentials:
```dart
await Khalti.init(
    publicKey: "your_khalti_public_key",
    enabledDebugging: false
);
```

#### Platform-Specific Setup

##### Android Setup
1. Open `android/app/build.gradle`
2. Update minimum SDK version if needed
3. Configure permissions in `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <uses-permission android:name="android.permission.INTERNET" />
   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
   <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
   ```

##### iOS Setup
1. Open `ios/Runner/Info.plist`
2. Add location permissions:
   ```xml
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>This app needs location access to find nearby blood banks</string>
   ```

##### Web Setup (Optional)
1. Enable web support:
   ```bash
   flutter config --enable-web
   ```
2. Create `web/index.html` if not exists

#### Run the Application
```bash
# Check connected devices
flutter devices

# Run on specific device
flutter run

# Run on Chrome (web)
flutter run -d chrome

# Run on Android emulator
flutter run -d android

# Build for release
flutter build apk
flutter build ios
```

## Development Workflow

### 1. Backend Development
```bash
# Start backend server
cd Server
npm start

# Monitor logs
# Server will log requests and errors to console

# Test API endpoints
curl http://192.168.137.1:8848/
```

### 2. Frontend Development
```bash
# Start Flutter app
flutter run

# Hot reload enabled by default
# Press 'r' to hot reload
# Press 'R' to hot restart
```

### 3. Database Management
```bash
# Access MongoDB shell
mongosh Blood_sanchaya

# View collections
show collections

# Query users
db.users.find()

# View blood status
db.bloodstatuses.find().pretty()
```

## Testing

### Backend Testing
```bash
# Install testing dependencies (if needed)
npm install --save-dev jest supertest

# Run tests (if configured)
npm test

# Manual API testing with curl
curl -X POST http://192.168.137.1:8848/signin \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"Test123!","phoneNumber":1234567890,"address":"Test Address","bloodGroup":"O+"}'
```

### Frontend Testing
```bash
# Run Flutter tests
flutter test

# Run widget tests
flutter test integration_test/

# Analyze code
flutter analyze
```

## Production Deployment

### 1. Backend Production Setup

#### Environment Configuration
Update `.env` for production:
```env
NODE_ENV=production
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/Blood_sanchaya
JWT_SECRET=strong_production_secret
PORT=80
HOST=0.0.0.0
```

#### PM2 Process Management
```bash
# Install PM2 globally
npm install -g pm2

# Start server with PM2
pm2 start app.js --name "blood-sanchaya-api"

# Monitor processes
pm2 list
pm2 logs blood-sanchaya-api

# Setup startup script
pm2 startup
pm2 save
```

#### Nginx Reverse Proxy (Optional)
```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:8848;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }
}
```

### 2. Flutter App Production Build

#### Android Release
```bash
# Generate signing key
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# Configure signing in android/app/build.gradle
# Update key.properties file

# Build release APK
flutter build apk --release

# Build App Bundle (recommended for Play Store)
flutter build appbundle --release
```

#### iOS Release
```bash
# Build iOS release
flutter build ios --release

# Open in Xcode for final configuration
open ios/Runner.xcworkspace
```

#### Web Release
```bash
# Build web release
flutter build web

# Deploy to web server
# Copy build/web contents to web server directory
```

### 3. Database Production Setup

#### MongoDB Atlas (Recommended)
1. Create account at [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. Create new cluster
3. Configure network access (whitelist IP addresses)
4. Create database user
5. Update connection string in `.env`

#### Self-Hosted MongoDB
```bash
# Security configuration
sudo ufw allow 27017

# Enable authentication
# Edit /etc/mongod.conf
security:
  authorization: enabled

# Restart MongoDB
sudo systemctl restart mongod

# Create admin user
mongosh
use admin
db.createUser({user: "admin", pwd: "strong_password", roles: ["userAdminAnyDatabase"]})
```

## Monitoring and Maintenance

### 1. Server Monitoring
```bash
# PM2 monitoring
pm2 monit

# System resource monitoring
htop
iostat
netstat -tulpn
```

### 2. Database Monitoring
```bash
# MongoDB status
mongosh --eval "db.serverStatus()"

# Collection statistics
mongosh Blood_sanchaya --eval "db.users.stats()"
```

### 3. Log Management
```bash
# PM2 logs
pm2 logs blood-sanchaya-api

# Rotate logs
pm2 install pm2-logrotate
```

## Troubleshooting

### Common Issues

#### Backend Issues
1. **Port already in use**
   ```bash
   # Find process using port
   netstat -tulpn | grep :8848
   # Kill process
   kill -9 <PID>
   ```

2. **MongoDB connection failed**
   ```bash
   # Check MongoDB status
   sudo systemctl status mongod
   # Start MongoDB
   sudo systemctl start mongod
   ```

3. **Module not found**
   ```bash
   # Reinstall dependencies
   rm -rf node_modules package-lock.json
   npm install
   ```

#### Flutter Issues
1. **Flutter doctor issues**
   ```bash
   flutter doctor -v
   # Follow recommended fixes
   ```

2. **Build failed**
   ```bash
   # Clean and rebuild
   flutter clean
   flutter pub get
   flutter run
   ```

3. **Android license not accepted**
   ```bash
   flutter doctor --android-licenses
   ```

### Performance Issues

#### Backend Performance
1. **Database indexing**
   ```javascript
   // Add indexes to frequently queried fields
   db.users.createIndex({ email: 1 })
   db.users.createIndex({ bloodGroup: 1 })
   ```

2. **Memory usage**
   ```bash
   # Monitor Node.js memory
   node --inspect app.js
   ```

#### Flutter Performance
1. **Build optimization**
   ```bash
   # Use --release flag for production builds
   flutter build apk --release --shrink
   ```

## Security Considerations

### 1. Backend Security
- Use HTTPS in production
- Implement rate limiting
- Validate all inputs
- Use environment variables for secrets
- Regular security updates

### 2. Database Security
- Enable authentication
- Use strong passwords
- Network whitelist
- Regular backups
- Encryption at rest

### 3. Mobile App Security
- Code obfuscation for release builds
- Secure API communication
- Local data encryption
- Root/jailbreak detection

## Backup and Recovery

### 1. Database Backup
```bash
# MongoDB backup
mongodump --db Blood_sanchaya --out /backup/$(date +%Y%m%d)

# Automated backup script
#!/bin/bash
BACKUP_DIR="/backup/$(date +%Y%m%d)"
mkdir -p $BACKUP_DIR
mongodump --db Blood_sanchaya --out $BACKUP_DIR
tar -czf $BACKUP_DIR.tar.gz $BACKUP_DIR
rm -rf $BACKUP_DIR
```

### 2. Code Backup
```bash
# Git repository backup
git remote add backup https://backup-server/repo.git
git push backup main
```

### 3. Recovery Procedures
1. Restore database from backup
2. Deploy latest code version
3. Restart services
4. Verify functionality

## Scaling Considerations

### 1. Horizontal Scaling
- Load balancer setup
- Multiple server instances
- Database replication

### 2. Vertical Scaling
- Increase server resources
- Optimize database queries
- Implement caching

### 3. CDN Integration
- Static asset delivery
- Geographic distribution
- Reduced latency

This setup guide provides comprehensive instructions for deploying the Blood Sanchaya system in various environments, from development to production.
