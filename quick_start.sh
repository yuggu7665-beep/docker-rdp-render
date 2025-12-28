# 🚀 Quick Start Script for Linux/Mac

echo "========================================"
echo "  Docker RDP Server - Quick Setup"
echo "========================================"
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "Initializing Git repository..."
    git init
    git add .
    git commit -m "Initial commit: Docker RDP server for Render"
    echo ""
    echo "[SUCCESS] Git repository initialized!"
    echo ""
    echo "NEXT STEPS:"
    echo "1. Create a new repository on GitHub"
    echo "2. Run these commands with your repo URL:"
    echo "   git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git"
    echo "   git branch -M main"
    echo "   git push -u origin main"
    echo ""
    echo "3. Then deploy to Render following DEPLOYMENT_GUIDE.md"
else
    echo "Git repository already exists."
    echo ""
    echo "Choose an option:"
    echo "1. Test locally with Docker"
    echo "2. Push changes to GitHub"
    echo "3. View deployment guide"
    echo ""
    read -p "Enter your choice (1-3): " choice
    
    case $choice in
        1)
            echo ""
            echo "Testing locally..."
            if [ ! -f .env ]; then
                cp .env.example .env
                echo "[INFO] Created .env file. Please edit it with your credentials."
                nano .env
            fi
            echo "Starting Docker containers..."
            docker-compose up -d
            echo ""
            echo "[SUCCESS] RDP server running locally!"
            echo "Connect to: localhost:3389"
            echo "Check logs: docker-compose logs -f"
            ;;
        2)
            echo ""
            echo "Pushing changes to GitHub..."
            git add .
            git commit -m "Update: $(date)"
            git push
            echo "[SUCCESS] Changes pushed!"
            ;;
        3)
            cat DEPLOYMENT_GUIDE.md
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
fi

echo ""
