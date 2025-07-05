# HR App Deployment Guide

## 🚀 Recommended Setup: Railway (Backend) + Vercel (Frontend)

**Why this combination?**
- ✅ **Railway:** Perfect for Node.js backends, better than Vercel for server-side apps
- ✅ **Vercel:** Excellent for React frontends, fast CDN, great developer experience
- ✅ **Cost-effective:** Both have generous free tiers

## Prerequisites
- Railway account (railway.app)
- Vercel account (vercel.com)
- MongoDB Atlas account
- Git repository with your code

## Quick Start

### Option 1: Railway Backend + Vercel Frontend (Recommended)
See `RAILWAY_DEPLOYMENT.md` for detailed instructions.

### Option 2: Vercel Backend + Vercel Frontend
See instructions below.

## Step 1: Prepare Your MongoDB Database

1. **Create a MongoDB Atlas cluster** (if you haven't already)
2. **Get your connection string** from MongoDB Atlas
3. **Create a database** and collection for your app

## Step 2: Deploy Backend to Vercel

### Option A: Deploy via Vercel CLI

1. **Install Vercel CLI:**
   ```bash
   npm i -g vercel
   ```

2. **Navigate to backend directory:**
   ```bash
   cd backend
   ```

3. **Deploy backend:**
   ```bash
   vercel
   ```

4. **Set environment variables in Vercel:**
   - Go to your Vercel dashboard
   - Select your backend project
   - Go to Settings > Environment Variables
   - Add:
     - `MONGODB_URI`: Your MongoDB connection string
     - `JWT_SECRET`: A secure random string

### Option B: Deploy via GitHub

1. **Push your code to GitHub**
2. **Connect your GitHub repo to Vercel**
3. **Set environment variables** in Vercel dashboard
4. **Deploy**

## Step 3: Deploy Frontend to Vercel

1. **Navigate to frontend directory:**
   ```bash
   cd frontend
   ```

2. **Create environment file:**
   Create `.env.production` file:
   ```
   REACT_APP_API_URL=https://your-backend-url.vercel.app
   ```

3. **Deploy frontend:**
   ```bash
   vercel
   ```

## Step 4: Update Frontend API URL

After deploying the backend, update the frontend's environment variable:

1. **In Vercel dashboard**, go to your frontend project
2. **Add environment variable:**
   - Name: `REACT_APP_API_URL`
   - Value: `https://your-backend-url.vercel.app`

## Step 5: Test Your Deployment

1. **Visit your frontend URL**
2. **Test HR login:**
   - Email: `siddhibansal0808@gmail.com`
   - Password: `siddhibansal`

## Environment Variables Summary

### Backend (.env)
```
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/database
JWT_SECRET=your-secret-key
PORT=5000
```

### Frontend (.env.production)
```
REACT_APP_API_URL=https://your-backend-url.vercel.app
```

## Troubleshooting

### Common Issues:

1. **CORS Errors:**
   - Make sure your backend CORS settings allow your frontend domain

2. **MongoDB Connection Issues:**
   - Check your MongoDB Atlas network access settings
   - Ensure your connection string is correct

3. **Environment Variables:**
   - Make sure all environment variables are set in Vercel dashboard
   - Redeploy after changing environment variables

### Support:
- Check Vercel logs in the dashboard
- Check MongoDB Atlas logs
- Test API endpoints directly

## URLs After Deployment

- **Frontend:** `https://your-frontend-name.vercel.app`
- **Backend:** `https://your-backend-name.vercel.app`

Remember to update the `REACT_APP_API_URL` in your frontend environment variables with your actual backend URL! 