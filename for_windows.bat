@echo off
REM GATE PYQ Downloader for Windows
REM Downloads all official GATE PDF question papers & keys from given CSV links.
REM Author: Marshal Yadav
REM License: MIT

SET "CSV_FILE=gate_papers.csv"
SET "OUTPUT_DIR=GATE_PYQs"

IF NOT EXIST "%OUTPUT_DIR%" (
    mkdir "%OUTPUT_DIR%"
)

echo 📘 Starting GATE PDF downloader...

REM Skip header line
for /f "skip=1 tokens=1-4 delims=," %%A in (%CSV_FILE%) do (
    set "year=%%~A"
    set "yearpaper=%%~B"
    set "url=%%~C"
    setlocal enabledelayedexpansion

    REM Remove quotes
    set "year=!year:"=!"
    set "yearpaper=!yearpaper:"=!"
    set "url=!url:"=!"

    REM Skip if URL is empty or doesn't end with .pdf
    if not "!url!"=="" (
        echo !url! | findstr /i "\.pdf$" >nul
        if !errorlevel! equ 0 (
            REM Replace spaces, slashes, brackets with _
            set "safe_yearpaper=!yearpaper: =_!"
            set "safe_yearpaper=!safe_yearpaper:/=_!"
            set "safe_yearpaper=!safe_yearpaper:[=_!"
            set "safe_yearpaper=!safe_yearpaper:]=_!"

            REM Create year folder if not exists
            if not exist "%OUTPUT_DIR%\!year!" mkdir "%OUTPUT_DIR%\!year!"

            REM Download PDF
            set "file_name=!safe_yearpaper!.pdf"
            echo 📥 Downloading: !file_name!
            curl -L -o "%OUTPUT_DIR%\!year!\!file_name!" "!url!" --silent --show-error
        )
    )

    endlocal
)

echo ✅ All available PDFs downloaded to "%OUTPUT_DIR%\"
pause
