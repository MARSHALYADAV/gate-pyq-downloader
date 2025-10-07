@echo off
REM GATE PYQ Downloader for Windows (1991–2025)
REM Downloads all official GATE PDF question papers & keys
REM Author: Marshal Yadav

SET "OUTPUT_DIR=GATE_PYQs"
IF NOT EXIST "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

echo 📘 Starting GATE PDF downloader...

setlocal enabledelayedexpansion

REM ===== CSV Data embedded directly (year|yearpaper|url) =====
for %%L in (
"2025 [CS]|2025 [CS]|"
"2025 Set 1 Paper|2025 Set 1 Paper|https://media.geeksforgeeks.org/wp-content/uploads/20250414103654373749/GATE-CS-2025-Set-1-Master-Question-Paper.pdf"
"2025 Set 1 Keys|2025 Set 1 Keys|https://media.geeksforgeeks.org/wp-content/uploads/20250414103654373134/GATE-CS-2025-Set-1-Answer-Key.pdf"
"2025 Set 2 Paper|2025 Set 2 Paper|https://media.geeksforgeeks.org/wp-content/uploads/20250414103654374715/GATE-CS-2025-Set-2-Master-Question-Paper.pdf"
"2025 Set 2 Keys|2025 Set 2 Keys|https://media.geeksforgeeks.org/wp-content/uploads/20250414103654374474/GATE-CS-2025-Set-2-Answer-Key.pdf"
"2024 [CS]|2024 [CS]|"
"2024 Set 1 Paper|2024 Set 1 Paper|https://media.geeksforgeeks.org/wp-content/uploads/20240328120758/CS124S5.pdf"
"2024 Set 1 Keys|2024 Set 1 Keys|https://media.geeksforgeeks.org/wp-content/uploads/20240328120617/CS1FinalAnswerKey.pdf"
"2024 Set 2 Paper|2024 Set 2 Paper|https://media.geeksforgeeks.org/wp-content/uploads/20240328120853/CS224S6.pdf"
"2024 Set 2 Keys|2024 Set 2 Keys|https://media.geeksforgeeks.org/wp-content/uploads/20240328120651/CS2FinalAnswerKey.pdf"
"2023|2023|"
"2023 Question Paper|2023 Question Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230804115257/GATE-20231.pdf"
"2023 Keys|2023 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230804115248/gate-2023-Answer-Key1.pdf"
"2022|2022|"
"2022 Question Paper|2022 Question Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230804115241/GATE-2022-part-1.pdf"
"2022 Keys|2022 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230804115244/GATE-2022-part-2.pdf"
"2021|2021|"
"2021 Set 1 Paper|2021 Set 1 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005201108/GATE2021_QP_CS-1.pdf"
"2021 Set 1 Keys|2021 Set 1 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005204320/2021-CS1-S5-Keys.pdf"
"2021 Set 2 Paper|2021 Set 2 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005201154/GATE2021_QP_CS-2.pdf"
"2021 Set 2 Keys|2021 Set 2 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005204347/2021-CS2-S6-Keys.pdf"
"2020|2020|"
"2020 Paper|2020 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005201357/GATE-CS-2020-Original-Paper.pdf"
"2020 Keys|2020 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005204916/GATE-CS-2020-Official-Keys.pdf"
"2019|2019|"
"2019 Paper|2019 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005201436/2019_CS_Paper1.pdf"
"2019 Keys|2019 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005204953/2019-Keys1.pdf"
"2018|2018|"
"2018 Paper|2018 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005201506/GATE2018.pdf"
"2018 Keys|2018 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005205031/Keys2018.pdf"
"2017|2017|"
"2017 Set 1 Paper|2017 Set 1 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005201915/GATE2017-Set-1_compressed1.pdf"
"2017 Set 1 Keys|2017 Set 1 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005205110/GATE2017-Set-1.pdf"
"2017 Set 2 Paper|2017 Set 2 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005202055/GATE2017-Set-2_compressed.pdf"
"2017 Set 2 Keys|2017 Set 2 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005205158/GATE2017-Set-2.pdf"
"2016|2016|"
"2016 Set 1 Paper|2016 Set 1 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005202156/GATE2016-Set-1.pdf"
"2016 Set 1 Keys|2016 Set 1 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005205238/2016CS-1_AnsKey.pdf"
"2016 Set 2 Paper|2016 Set 2 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005202226/GATE2016-Set-2.pdf"
"2016 Set 2 Keys|2016 Set 2 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005205308/2016CS-2_AnsKey.pdf"
"2015 Set 1 Paper|2015 Set 1 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005202308/GATE2015-Set-1.pdf"
"2015 Set 1 Keys|2015 Set 1 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005205446/2015CS_S05_compressed.pdf"
"2015 Set 2 Paper|2015 Set 2 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005202336/GATE2015-Set-2.pdf"
"2015 Set 2 Keys|2015 Set 2 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005205713/2015CS_S06_compressed.pdf"
"2015 Set 3 Paper|2015 Set 3 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005202414/GATE2015-Set-3.pdf"
"2015 Set 3 Keys|2015 Set 3 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005205831/2015CS_S07_compressed.pdf"
"2014 Set 1 Paper|2014 Set 1 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005202448/GATE2014-Set-1.pdf"
"2014 Set 1 Keys|2014 Set 1 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005205916/2014Key_CS_01.pdf"
"2014 Set 2 Paper|2014 Set 2 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005202522/GATE2014-Set-2.pdf"
"2014 Set 2 Keys|2014 Set 2 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005205944/2014Key_CS_02.pdf"
"2014 Set 3 Paper|2014 Set 3 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005202559/GATE2014-Set-3.pdf"
"2014 Set 3 Keys|2014 Set 3 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005210023/2014Key_CS_03.pdf"
"2013 Paper|2013 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005202631/GATE2013.pdf"
"2013 Keys|2013 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005210048/Key_CS_2013.pdf"
"2012 Paper|2012 Paper|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005202656/GATE2012.pdf"
"2012 Keys|2012 Keys|https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211005210114/Key_CS_2012.pdf"
) do (
    for /f "tokens=1-3 delims=|" %%A in ("%%~L") do (
        set "year=%%A"
        set "yearpaper=%%B"
        set "url=%%C"

        if not "!url!"=="" (
            set "safe_yearpaper=!yearpaper: =_!"
            set "safe_yearpaper=!safe_yearpaper:/=_!"
            set "safe_yearpaper=!safe_yearpaper:[=_!"
            set "safe_yearpaper=!safe_yearpaper:]=_!"
            set "safe_yearpaper=!safe_yearpaper:|=_!"

            if not exist "%OUTPUT_DIR%\!year!" mkdir "%OUTPUT_DIR%\!year!"
            set "file_name=!safe_yearpaper!.pdf"
            echo 📥 Downloading: !file_name!
            curl -L -o "%OUTPUT_DIR%\!year!\!file_name!" "!url!" --silent --show-error
        )
    )
)

echo ✅ All available PDFs downloaded to "%OUTPUT_DIR%\"
pause
