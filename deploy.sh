#!/bin/bash

echo "🚀 HR App Deployment Script"
echo "=========================="

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "❌ Vercel CLI not found. Installing..."
    npm install -g vercel
fi

echo "📦 Deploying Backend..."
cd backend
vercel --prod

echo "📦 Deploying Frontend..."
cd ../frontend
vercel --prod

echo "✅ Deployment complete!"
echo ""
echo "📝 Next steps:"
echo "1. Set environment variables in Vercel dashboard"
echo "2. Update REACT_APP_API_URL with your backend URL"
echo "3. Test your deployment"
echo ""
echo "🔗 Check DEPLOYMENT.md for detailed instructions" 