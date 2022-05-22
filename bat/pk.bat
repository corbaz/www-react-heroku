cls
netstat -ano | findstr :3000
netstat -ano | findstr :8081
call npx kill-port 3000 8081
netstat -ano | findstr :3000
netstat -ano | findstr :8081