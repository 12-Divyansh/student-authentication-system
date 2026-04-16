# Deployment Guide

This guide will help you deploy the Student Authentication System to production using Render (backend) and Vercel (frontend).

## Prerequisites

- MongoDB Atlas account (for database)
- Render account (for backend deployment)
- Vercel account (for frontend deployment)
- Git repository with your code

## Backend Deployment (Render)

### 1. Set up MongoDB Atlas

1. Go to [MongoDB Atlas](https://www.mongodb.com/atlas)
2. Create a new cluster (free tier is sufficient)
3. Create a database user with username and password
4. Get your connection string from the Atlas dashboard
5. Whitelist all IP addresses (0.0.0.0/0) for development

### 2. Prepare Backend for Deployment

1. Update your `.env` file with production values:
   ```
   PORT=5000
   MONGODB_URI=mongodb+srv://<username>:<password>@<cluster-url>/student-auth?retryWrites=true&w=majority
   JWT_SECRET=your_super_secure_jwt_secret_key_for_production
   NODE_ENV=production
   ```

2. Update `package.json` to include the start script:
   ```json
   "scripts": {
     "start": "node server.js",
     "dev": "nodemon server.js"
   }
   ```

### 3. Deploy to Render

1. Push your code to a GitHub repository
2. Go to [Render](https://render.com)
3. Click "New" → "Web Service"
4. Connect your GitHub repository
5. Configure the service:
   - **Name**: student-auth-backend
   - **Root Directory**: backend
   - **Runtime**: Node
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Instance Type**: Free

6. Add Environment Variables:
   - `PORT`: 5000
   - `MONGODB_URI`: Your MongoDB Atlas connection string
   - `JWT_SECRET`: Your secure JWT secret
   - `NODE_ENV`: production

7. Click "Create Web Service"

### 4. Test Backend

Once deployed, your backend will be available at: `https://your-app-name.onrender.com`

Test the API endpoints:
- `GET https://your-app-name.onrender.com/api/student` (should return 401 without token)
- `POST https://your-app-name.onrender.com/api/register`
- `POST https://your-app-name.onrender.com/api/login`

## Frontend Deployment (Vercel)

### 1. Prepare Frontend for Deployment

1. Create a `.env.production` file in the frontend directory:
   ```
   REACT_APP_API_URL=https://your-backend-name.onrender.com/api
   ```

2. Update `package.json` to ensure proper build:
   ```json
   "scripts": {
     "start": "react-scripts start",
     "build": "react-scripts build",
     "test": "react-scripts test",
     "eject": "react-scripts eject"
   }
   ```

3. Remove the proxy setting from `package.json` (not needed in production):
   ```json
   // Remove this line:
   "proxy": "http://localhost:5000"
   ```

### 2. Deploy to Vercel

1. Go to [Vercel](https://vercel.com)
2. Click "New Project"
3. Import your GitHub repository
4. Configure the project:
   - **Framework Preset**: Create React App
   - **Root Directory**: frontend
   - **Build Command**: `npm install && npm run build`
   - **Output Directory**: build

5. Add Environment Variables:
   - `REACT_APP_API_URL`: `https://your-backend-name.onrender.com/api`

6. Click "Deploy"

### 3. Test Frontend

Once deployed, your frontend will be available at: `https://your-project-name.vercel.app`

## Troubleshooting

### Common Issues

1. **CORS Errors**: Ensure your backend allows requests from your frontend domain
2. **Database Connection**: Check MongoDB Atlas connection string and IP whitelist
3. **Environment Variables**: Verify all environment variables are set correctly
4. **Build Failures**: Check build logs for missing dependencies or syntax errors

### CORS Configuration

If you encounter CORS issues, update your backend CORS configuration:

```javascript
// In server.js
const cors = require('cors');

app.use(cors({
  origin: ['https://your-frontend-domain.vercel.app', 'http://localhost:3000'],
  credentials: true
}));
```

### MongoDB Connection Issues

1. Verify your connection string format
2. Check database user permissions
3. Ensure IP whitelist includes your deployment service IPs

## Production Best Practices

1. **Security**:
   - Use strong JWT secrets
   - Enable HTTPS (automatic on Render/Vercel)
   - Validate all inputs
   - Use environment variables for sensitive data

2. **Performance**:
   - Implement rate limiting
   - Use CDN for static assets
   - Optimize database queries
   - Enable caching

3. **Monitoring**:
   - Set up logging
   - Monitor error rates
   - Track performance metrics
   - Set up alerts

## Domain Configuration (Optional)

### Custom Domain for Backend

1. In Render dashboard, go to your service
2. Click "Custom Domains"
3. Add your custom domain
4. Update DNS records as instructed

### Custom Domain for Frontend

1. In Vercel dashboard, go to your project
2. Click "Settings" → "Domains"
3. Add your custom domain
4. Update DNS records as instructed

## Final Testing Checklist

- [ ] User can register new account
- [ ] User can login with valid credentials
- [ ] Invalid credentials show error message
- [ ] Dashboard displays student information
- [ ] Password update works correctly
- [ ] Course update works correctly
- [ ] Logout clears session and redirects
- [ ] Protected routes redirect unauthenticated users
- [ ] Forms show appropriate validation
- [ ] Responsive design works on mobile devices

## Support

If you encounter issues during deployment:

1. Check deployment logs for error messages
2. Verify environment variables are correctly set
3. Test API endpoints individually
4. Check browser console for frontend errors
5. Ensure database is accessible from your deployment platform
