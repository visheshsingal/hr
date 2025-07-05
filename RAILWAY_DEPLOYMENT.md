# HR App Backend Deployment - Railway

## Why Railway for Backend?

Railway is perfect for Node.js backends because:
- ✅ **Better for server-side apps** than Vercel
- ✅ **Automatic HTTPS** and custom domains
- ✅ **Environment variables** management
- ✅ **Database integration** (PostgreSQL, MySQL, MongoDB)
- ✅ **Free tier** available
- ✅ **Easy scaling**

## Prerequisites

1. **Railway account** (railway.app)
2. **GitHub account** with your code
3. **MongoDB Atlas** database

## Step 1: Deploy Backend to Railway

### Option A: Deploy via Railway Dashboard

1. **Go to [Railway Dashboard](https://railway.app/dashboard)**

2. **Click "New Project"**

3. **Choose "Deploy from GitHub repo"**

4. **Select your repository**

5. **Configure the deployment:**
   - **Root Directory:** `backend`
   - **Build Command:** `npm install`
   - **Start Command:** `npm start`

6. **Set Environment Variables:**
   - Go to your project → Variables tab
   - Add:
     ```
     MONGODB_URI=mongodb+srv://vishesh:vishesh@cluster0.yb6l8g5.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0
     JWT_SECRET=your_super_secret_jwt_key_2024
     NODE_ENV=production
     PORT=3000
     ```

### Option B: Deploy via Railway CLI

1. **Install Railway CLI:**
   ```bash
   npm install -g @railway/cli
   ```

2. **Login to Railway:**
   ```bash
   railway login
   ```

3. **Navigate to backend:**
   ```bash
   cd backend
   ```

4. **Deploy:**
   ```bash
   railway up
   ```

5. **Set environment variables:**
   ```bash
   railway variables set MONGODB_URI="your_mongodb_uri"
   railway variables set JWT_SECRET="your_jwt_secret"
   railway variables set NODE_ENV="production"
   ```

## Step 2: Get Your Backend URL

After deployment, Railway will give you a URL like:
```
https://your-app-name-production.up.railway.app
```

**Save this URL** - you'll need it for the frontend!

## Step 3: Deploy Frontend to Vercel

1. **Navigate to frontend directory:**
   ```bash
   cd frontend
   ```

2. **Create `.env.production`:**
   ```
   REACT_APP_API_URL=https://your-app-name-production.up.railway.app
   ```

3. **Deploy to Vercel:**
   ```bash
   vercel --prod
   ```

## Step 4: Update Frontend Environment Variables

In your Vercel dashboard:
1. Go to your frontend project
2. Settings → Environment Variables
3. Add:
   - **Name:** `REACT_APP_API_URL`
   - **Value:** `https://your-app-name-production.up.railway.app`

## Step 5: Test Your Deployment

1. **Visit your frontend URL**
2. **Test HR login:**
   - Email: `siddhibansal0808@gmail.com`
   - Password: `siddhibansal`

## Railway vs Vercel Comparison

| Feature | Railway | Vercel |
|---------|---------|--------|
| **Backend Apps** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Frontend Apps** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Database** | ⭐⭐⭐⭐⭐ | ⭐⭐ |
| **Environment Variables** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Free Tier** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Ease of Use** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

## Environment Variables Summary

### Railway (Backend)
```
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/database
JWT_SECRET=your-secret-key
NODE_ENV=production
PORT=3000
```

### Vercel (Frontend)
```
REACT_APP_API_URL=https://your-app-name-production.up.railway.app
```

## Troubleshooting

### Common Railway Issues:

1. **Build Failures:**
   - Check Railway logs in dashboard
   - Ensure all dependencies are in `package.json`

2. **Environment Variables:**
   - Make sure all variables are set in Railway dashboard
   - Redeploy after changing variables

3. **MongoDB Connection:**
   - Check MongoDB Atlas network access
   - Ensure connection string is correct

4. **CORS Issues:**
   - Verify frontend URL is in CORS settings
   - Check Railway logs for CORS errors

### Railway CLI Commands:
```bash
# View logs
railway logs

# Check status
railway status

# Redeploy
railway up

# View variables
railway variables

# Open in browser
railway open
```

## URLs After Deployment

- **Backend (Railway):** `https://your-app-name-production.up.railway.app`
- **Frontend (Vercel):** `https://your-frontend-name.vercel.app`

## Cost Comparison

### Railway Free Tier:
- $5 credit monthly
- Perfect for small projects
- Auto-scales based on usage

### Vercel Free Tier:
- Unlimited deployments
- Great for frontend hosting
- Limited serverless function usage

**Recommendation:** Use Railway for backend + Vercel for frontend = Best of both worlds! 🚀 