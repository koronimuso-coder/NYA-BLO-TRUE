@echo off
echo ========================================
echo   NYA BLO - Super App Launch
echo ========================================
echo.

cd apps\web

echo [0/3] Verification des dependances...
if not exist node_modules (
    echo.
    echo [ATTENTION] node_modules manquant!
    echo.
    echo Lancer d'abord: INSTALL.bat
    echo.
    pause
    exit /b 1
)

echo [1/3] Dependances OK
echo.
echo [2/3] Starting development server...
echo.
echo Ouvrir dans le navigateur: http://localhost:3000
echo.
echo Pages disponibles:
echo   - Homepage (3D + Voice):     http://localhost:3000
echo   - Market:                    http://localhost:3000/shop
echo   - CV Builder:                http://localhost:3000/cv-builder
echo   - Digital Twin:              http://localhost:3000/digital-twin
echo   - Tech Stack:                http://localhost:3000/tech-stack
echo   - Advanced Tech:             http://localhost:3000/advanced-tech
echo.
echo Appuyer sur Ctrl+C pour arreter
echo ========================================
echo.

call npm run dev
