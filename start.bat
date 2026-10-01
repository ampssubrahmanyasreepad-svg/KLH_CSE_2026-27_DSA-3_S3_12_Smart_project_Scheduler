@echo off
echo =====================================================================
echo  Starting NexusPlan Full-Stack Platform
echo  Backend: Spring Boot (Port 8080)
echo  Frontend: React Vite (Port 5173)
echo =====================================================================

start "NexusPlan Backend" cmd /k "cd backend && ..\.tools\apache-maven-3.9.6\bin\mvn.cmd spring-boot:run"
start "NexusPlan Frontend" cmd /k "cd frontend && npm run dev"

echo Both services launched!
echo Open your browser at: http://localhost:5173
pause
