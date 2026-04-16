# Student Authentication System (MERN Stack)

A complete student login and registration system built with the MERN stack (MongoDB, Express, React, Node.js).

## Features

- **Student Registration**: Create new student accounts with email validation
- **Secure Login**: JWT-based authentication with password hashing
- **Protected Dashboard**: Access student profile and update information
- **Password Management**: Update passwords with old password verification
- **Course Management**: Change enrolled courses
- **Secure Logout**: Clear tokens and redirect to login
- **Responsive Design**: Modern UI with Bootstrap and custom CSS

## Project Structure

```
Student-Reg-App/
├── backend/
│   ├── models/
│   │   └── Student.js          # MongoDB Student model
│   ├── middleware/
│   │   └── auth.js             # JWT authentication middleware
│   ├── routes/
│   │   └── auth.js             # Authentication routes
│   ├── .env                    # Environment variables
│   ├── package.json            # Backend dependencies
│   └── server.js               # Express server setup
├── frontend/
│   ├── public/
│   │   └── index.html          # HTML template
│   ├── src/
│   │   ├── components/
│   │   │   ├── Register.js     # Registration form
│   │   │   ├── Login.js        # Login form
│   │   │   ├── Dashboard.js    # Protected dashboard
│   │   │   └── ProtectedRoute.js # Route protection
│   │   ├── utils/
│   │   │   └── api.js          # Axios configuration
│   │   ├── App.js              # Main app with routing
│   │   ├── index.js            # React entry point
│   │   └── index.css           # Custom styles
│   └── package.json            # Frontend dependencies
└── README.md
```

## Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Configure environment variables in `.env`:
   ```
   PORT=5000
   MONGODB_URI=mongodb://localhost:27017/student-auth
   JWT_SECRET=your_jwt_secret_key_here_change_in_production
   NODE_ENV=development
   ```

4. Start the backend server:
   ```bash
   npm run dev
   ```

## Frontend Setup

1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the React development server:
   ```bash
   npm start
   ```

## API Endpoints

### Authentication Routes

- `POST /api/register` - Register a new student
  - Body: `{ name, email, password, course }`
  - Returns: JWT token and student data

- `POST /api/login` - Authenticate student
  - Body: `{ email, password }`
  - Returns: JWT token and student data

- `PUT /api/update-password` - Update password
  - Body: `{ oldPassword, newPassword }`
  - Requires: JWT token in Authorization header

- `PUT /api/update-course` - Update course
  - Body: `{ course }`
  - Requires: JWT token in Authorization header

- `GET /api/student` - Get student details
  - Requires: JWT token in Authorization header

## Database Schema

### Student Model

```javascript
{
  name: String (required),
  email: String (required, unique),
  password: String (required, hashed),
  course: String (required),
  createdAt: Date,
  updatedAt: Date
}
```

## Security Features

- **Password Hashing**: Uses bcryptjs for secure password storage
- **JWT Authentication**: JSON Web Tokens for secure session management
- **Protected Routes**: Middleware to protect sensitive endpoints
- **Input Validation**: Server-side validation for all inputs
- **Error Handling**: Comprehensive error handling and user feedback

## Frontend Components

### Register Component
- Form validation
- Email uniqueness check
- Password strength requirements
- Course selection dropdown

### Login Component
- Credential validation
- JWT token storage
- Automatic redirect to dashboard

### Dashboard Component
- Student information display
- Password update form with old password verification
- Course change functionality
- Secure logout

### ProtectedRoute Component
- Route protection for authenticated users
- Automatic redirect to login for unauthorized access
- Token validation

## Technologies Used

### Backend
- **Node.js**: JavaScript runtime
- **Express.js**: Web framework
- **MongoDB**: NoSQL database
- **Mongoose**: MongoDB object modeling
- **bcryptjs**: Password hashing
- **jsonwebtoken**: JWT implementation
- **cors**: Cross-origin resource sharing
- **dotenv**: Environment variable management

### Frontend
- **React**: JavaScript library for UI
- **React Router**: Client-side routing
- **Axios**: HTTP client for API calls
- **Bootstrap**: CSS framework for styling
- **Custom CSS**: Additional styling and animations

## Deployment

### Backend Deployment (Render)
1. Set up MongoDB Atlas database
2. Update environment variables in Render
3. Deploy the backend to Render

### Frontend Deployment (Vercel)
1. Set up the API URL in environment variables
2. Deploy the frontend to Vercel

## Usage

1. **Register**: Create a new student account
2. **Login**: Authenticate with your credentials
3. **Dashboard**: View your profile and update information
4. **Update Password**: Change your password securely
5. **Change Course**: Update your enrolled course
6. **Logout**: Securely end your session

## Error Handling

- Duplicate email registration
- Invalid login credentials
- Unauthorized access attempts
- Token expiration handling
- Form validation errors
- Network error handling

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.
