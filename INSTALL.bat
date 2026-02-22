@echo off
echo ========================================
echo   NYA BLO - Installation Complete
echo ========================================
echo.
echo [INFO] Installation de toutes les dependances...
echo.

cd apps\web

echo [1/2] Nettoyage des anciennes installations...
if exist node_modules (
    echo   - Suppression node_modules...
    rmdir /s /q node_modules
)
if exist package-lock.json (
    echo   - Suppression package-lock.json...
    del package-lock.json
)

echo.
echo [2/2] Installation des packages npm...
echo.
echo Packages qui seront installes:
echo   - Next.js 16.1.6
echo   - React 19
echo   - Three.js 0.171 + React Three Fiber
echo   - GSAP + Framer Motion
echo   - Firebase
echo   - Lucide Icons
echo   - Tailwind CSS
echo.

call npm install

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERREUR] L'installation a echoue.
    echo.
    echo Solutions possibles:
    echo   1. Verifier connexion internet
    echo   2. Vider le cache npm: npm cache clean --force
    echo   3. Reinstaller Node.js depuis nodejs.org
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   Installation REUSSIE!
echo ========================================
echo.
echo Prochaine etape: Lancer l'application
echo   - Double-clic sur: START.bat
echo   - Ou commande: npm run dev
echo.
pause
