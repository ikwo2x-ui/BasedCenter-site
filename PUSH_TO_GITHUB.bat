@echo off
title Push BasedCenter presentations to GitHub Pages
cd /d "%~dp0"

echo.
echo  This publishes the UPDATED BasedMarketLab deck ($0.10 USDC on Base)
echo  to: https://ikwo2x-ui.github.io/BasedCenter-site/
echo.
echo  Local is already correct. Live GitHub still has the old deck until you push.
echo.

where gh >nul 2>&1
if not errorlevel 1 (
  gh auth status 2>nul
  if errorlevel 1 (
    echo Logging into GitHub in browser...
    gh auth login -h github.com -p https -w
  )
  gh auth setup-git 2>nul
)

git status -sb
echo.
echo Pushing...
git push origin main
if errorlevel 1 (
  echo.
  echo Push failed. Try:
  echo   1^) GitHub Desktop: open this folder and Push origin
  echo   2^) Or run:  gh auth login
  echo              git push origin main
  pause
  exit /b 1
)

echo.
echo  SUCCESS. Wait 1-2 minutes, then hard-refresh:
echo  https://ikwo2x-ui.github.io/BasedCenter-site/
echo  https://ikwo2x-ui.github.io/BasedCenter-site/view-marketlab.html
echo.
pause
