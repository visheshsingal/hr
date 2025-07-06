# HR App Deployment Guide

This guide will help you deploy your HR Management System with the backend on Render/Railway and frontend on Vercel.

## Prerequisites

- GitHub repository with your code
- MongoDB Atlas account (for database)
- Render or Railway account (for backend)
- Vercel account (for frontend)

## Step 1: Deploy Backend

### Option A: Deploy to Render

1. **Create a new Web Service**
   - Go to [Render Dashboard](https://dashboard.render.com)
   - Click "New +" → "Web Service"
   - Connect your GitHub repository

2. **Configure the service**
   - **Name**: `hr-app-backend`
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `node server.js`
   - **Root Directory**: `backend`

3. **Set Environment Variables**
   ```
   NODE_ENV=production
   MONGODB_URI=your_mongodb_atlas_connection_string
   JWT_SECRET=your_jwt_secret_key
   PORT=5000
   ```

4. **Deploy**
   - Click "Create Web Service"
   - Wait for deployment to complete
   - Note your backend URL (e.g., `https://hr-app-backend.onrender.com`)

### Option B: Deploy to Railway

1. **Create a new project**
   - Go to [Railway Dashboard](https://railway.app)
   - Click "New Project" → "Deploy from GitHub repo"
   - Select your repository

2. **Configure the service**
   - Set the root directory to `backend`
   - Railway will auto-detect it's a Node.js app

3. **Set Environment Variables**
   ```
   NODE_ENV=production
   MONGODB_URI=your_mongodb_atlas_connection_string
   JWT_SECRET=your_jwt_secret_key
   PORT=5000
   ```

4. **Deploy**
   - Railway will automatically deploy
   - Note your backend URL from the generated domain

## Step 2: Deploy Frontend

### Deploy to Vercel

1. **Import your repository**
   - Go to [Vercel Dashboard](https://vercel.com)
   - Click "New Project"
   - Import your GitHub repository

2. **Configure the project**
   - **Framework Preset**: `Create React App`
   - **Root Directory**: `frontend`
   - **Build Command**: `npm run build`
   - **Output Directory**: `build`

3. **Set Environment Variables**
   ```
   REACT_APP_API_URL=https://your-backend-url.onrender.com
   REACT_APP_ENV=production
   ```
   **Replace `your-backend-url.onrender.com` with your actual backend URL**

4. **Deploy**
   - Click "Deploy"
   - Vercel will build and deploy your app
   - Your app will be available at the generated URL

## Step 3: Test Your Deployment

1. **Test Backend**
   - Visit `https://your-backend-url.onrender.com/api/health`
   - Should return: `{"status":"OK","message":"HR App Backend is running"}`

2. **Test Frontend**
   - Visit your Vercel URL
   - Try logging in and using the app
   - Check browser console for any errors

## Environment Variables Reference

### Backend (.env)
```env
NODE_ENV=production
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/hr-app
JWT_SECRET=your_super_secret_jwt_key_here
PORT=5000
```

### Frontend (Vercel Environment Variables)
```env
REACT_APP_API_URL=https://your-backend-url.onrender.com
REACT_APP_ENV=production
```

## Troubleshooting

### Common Issues

1. **CORS Errors**
   - Make sure your backend URL is correct in frontend environment variables
   - Check that the URL includes `https://`
   - Verify backend CORS configuration

2. **API Not Found**
   - Test your backend URL directly in browser
   - Check backend logs for errors
   - Verify environment variables are set correctly

3. **Database Connection Issues**
   - Check MongoDB Atlas connection string
   - Ensure IP whitelist includes `0.0.0.0/0` for Render/Railway
   - Verify database credentials

4. **Build Failures**
   - Check build logs in Vercel
   - Ensure all dependencies are in package.json
   - Verify Node.js version compatibility

### Useful Commands

**Test backend locally:**
```bash
cd backend
npm install
npm start
```

**Test frontend locally:**
```bash
cd frontend
npm install
npm start
```

**Check environment variables:**
```bash
# Backend
echo $MONGODB_URI
echo $JWT_SECRET

# Frontend
echo $REACT_APP_API_URL
```

## Security Notes

- Use strong JWT secrets
- Keep environment variables secure
- Use HTTPS in production
- Regularly update dependencies
- Monitor your application logs

## Support

If you encounter issues:
1. Check the deployment logs
2. Verify all environment variables
3. Test endpoints individually
4. Check browser console for errors 