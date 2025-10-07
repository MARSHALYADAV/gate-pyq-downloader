#!/bin/bash
# GATE PYQ Downloader
# Downloads all official GATE PDF question papers & keys from given CSV links.
# Author: Marshal Yadav
# License: MIT

CSV_FILE="gate_papers.csv"
OUTPUT_DIR="GATE_PYQs"

mkdir -p "$OUTPUT_DIR"

echo "📘 Starting GATE PDF downloader..."

tail -n +2 "$CSV_FILE" | while IFS=',' read -r year yearpaper url url2; do
    year=$(echo "$year" | tr -d '"')
    yearpaper=$(echo "$yearpaper" | tr -d '"')
    url=$(echo "$url" | tr -d '"')

    # Skip non-PDF or empty entries
    if [[ -z "$url" || "$url" != *".pdf"* ]]; then
        continue
    fi

    safe_yearpaper=$(echo "$yearpaper" | tr ' /[]' '_' | tr -s '_')
    year_folder="$OUTPUT_DIR/$year"
    mkdir -p "$year_folder"

    file_name="${safe_yearpaper}.pdf"

    echo "📥 Downloading: $file_name"
    curl -L -o "$year_folder/$file_name" "$url" --silent --show-error
done

echo "✅ All available PDFs downloaded to '$OUTPUT_DIR/'"
