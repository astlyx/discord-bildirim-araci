@echo off
title Discord Bildirim Araci - Build

echo.
echo  ================================================
echo   Discord Bildirim Araci - EXE Builder
echo  ================================================
echo.

:: Python kontrolu
python --version >nul 2>&1
if errorlevel 1 (
    echo  [HATA] Python bulunamadi!
    echo  https://www.python.org/downloads/ adresinden yukleyin.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('python --version 2^>^&1') do set PY_VER=%%i
echo  [OK] %PY_VER% bulundu.
echo.

:: Bagimliliklar
echo  [1/3] Bagimliliklar yukleniyor...
echo  ------------------------------------------------
python -m pip install --quiet --upgrade discord.py PyQt6 requests pyinstaller
if errorlevel 1 (
    echo.
    echo  [HATA] Paket yuklemesi basarisiz!
    pause
    exit /b 1
)
echo  [OK] Tum paketler hazir.
echo.

:: main.py kontrolu
if not exist "main.py" (
    echo  [HATA] main.py bu klasorde bulunamadi!
    echo  build.bat ile main.py ayni klasorde olmali.
    pause
    exit /b 1
)

:: Eski build dosyalarini temizle
echo  [2/3] Eski build dosyalari temizleniyor...
if exist "build" rmdir /s /q "build"
if exist "dist"  rmdir /s /q "dist"
del /q *.spec 2>nul
echo  [OK] Temizlendi.
echo.

:: PyInstaller ile derle (python -m ile PATH sorunu asilir)
echo  [3/3] EXE olusturuluyor (bu biraz surebilir)...
echo  ------------------------------------------------
python -m PyInstaller --onefile --noconsole --name "DiscordBildirimAraci" --collect-all PyQt6 --hidden-import discord --hidden-import discord.ext.commands --hidden-import requests main.py

if errorlevel 1 (
    echo.
    echo  [HATA] Derleme basarisiz! Yukaridaki hatayi kontrol edin.
    pause
    exit /b 1
)

:: config.json kopyala
if exist "config.json" (
    copy /y "config.json" "dist\config.json" >nul
    echo  [OK] config.json dist klasorune kopyalandi.
)

echo.
echo  ================================================
echo   BUILD BASARIYLA TAMAMLANDI!
echo   EXE: dist\DiscordBildirimAraci.exe
echo  ================================================
echo.
echo  NOT: config.json her zaman EXE ile ayni klasorde olmali.
echo.

set /p OPEN_FOLDER=Dist klasorunu ac? (E/H): 
if /i "%OPEN_FOLDER%"=="E" explorer dist

pause
