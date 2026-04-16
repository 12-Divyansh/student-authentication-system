@echo off
echo Starting Student Authentication System...
echo.

echo Installing backend dependencies...
cd backend
call npm install
echo Backend dependencies installed successfully!

echo.
echo Installing frontend dependencies...
cd ../frontend
call npm install
echo Frontend dependencies installed successfully!

echo.
echo Starting backend server...
cd ../backend
start "Backend Server" cmd /k "npm run dev"

echo.
echo Starting frontend server...
cd ../frontend
start "Frontend Server" cmd /k "npm start"

echo.
echo Both servers are starting...
echo Backend will be available at: http://localhost:5000
echo Frontend will be available at: http://localhost:3000
echo.
echo Press any key to exit...
pause > nul
