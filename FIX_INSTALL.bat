@echo off
setlocal

echo ========================================
echo   NYA BLO - Fix Installation
echo ========================================
echo.
echo [INFO] Correction du probleme Three.js...
echo.

cd /d "%~dp0apps\web"

echo Repertoire actuel: %CD%
echo.

echo [1/4] Verification package.json...
if not exist package.json (
    echo [ERREUR] package.json introuvable!
    pause
    exit /b 1
)
echo   OK - package.json trouve

echo.
echo [2/4] Nettoyage cache npm...
call npm cache clean --force 2>nul

echo.
echo [3/4] Installation des dependances...
echo.
echo Packages a installer:
echo   - three@0.171.0
echo   - @react-three/fiber@8.17.0
echo   - @react-three/drei@9.117.0
echo   - @types/three@0.171.0
echo   + autres dependances...
echo.

call npm install

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERREUR] Installation echouee
    echo.
    echo Solutions:
    echo   1. Verifier la connexion internet
    echo   2. Essayer: npm install --legacy-peer-deps
    echo   3. Reinstaller Node.js
    echo.
    pause
    exit /b 1
)

echo.
echo [4/4] Verification installation...
if exist node_modules\three (
    echo   OK - Three.js installe
) else (
    echo   [ATTENTION] Three.js non detecte
)

if exist node_modules\@react-three\fiber (
    echo   OK - React Three Fiber installe
) else (
    echo   [ATTENTION] React Three Fiber non detecte
)

echo.
echo ========================================
echo   Installation TERMINEE avec succes!
echo ========================================
echo.
echo Prochaine etape:
echo   Double-clic sur START.bat
echo.
pause
