@echo off
echo ========================================================
echo   TNCFD Shift System - GitHub Push
echo ========================================================
echo.
echo [1/3] Adding files to git...
git add index.html personnel.html "1150116五大人員編制_視覺化系統.html" README.md notes
echo [2/3] Committing changes...
git commit -m "feat: add visual personnel roster system (personnel.html)"
echo [3/3] Pushing to GitHub (origin main)...
git push origin main
echo.
if %ERRORLEVEL% EQU 0 (
    echo ========================================================
    echo   SUCCESS! Upload completed.
    echo   Shift System URL: https://tncfd500.github.io/tncfd-shift/
    echo   Personnel System URL: https://tncfd500.github.io/tncfd-shift/personnel.html
    echo ========================================================
) else (
    echo [ERROR] Push failed. Please check credentials or error messages above.
)
echo.
pause