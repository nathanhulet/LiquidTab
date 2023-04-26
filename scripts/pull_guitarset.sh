#!/bin/bash

# Set up array of URLs, subfolder names, and zip file names
urls=(
  "https://zenodo.org/record/3371780/files/annotation.zip"
  "https://zenodo.org/record/3371780/files/audio_hex-pickup_debleeded.zip"
  "https://zenodo.org/record/3371780/files/audio_hex-pickup_original.zip"
  "https://zenodo.org/record/3371780/files/audio_mono-mic.zip"
  "https://zenodo.org/record/3371780/files/audio_mono-pickup_mix.zip"
)

# Check if data directory exists
if [ -d "data" ]; then
    echo "Removing existing data directory..."
    rm -rf data
fi

# Create new data directory
echo "Creating new data directory..."
mkdir data

# Loop through URLs and download/unzip each one
for i in "${urls[@]}"
do
  # Get the subfolder name by splitting the URL on the last slash and removing the .zip extension
  subfolder=$(echo $i | awk -F/ '{print $NF}' | sed 's/.zip//g')
  # Get the zip file name by splitting the URL on the last slash
  zip_file=$(echo $i | awk -F/ '{print $NF}')
  
  # create subfolder in data directory
  mkdir data/$subfolder

  # download zip file
  echo "Downloading $zip_file..."
  curl -L -o data/$subfolder/$zip_file $i

  # unzip file
  echo "Unzipping $zip_file..."
  unzip data/$subfolder/$zip_file -d data/$subfolder

  # remove zip file
  echo "Removing $zip_file..."
  rm data/$subfolder/$zip_file

done

echo "Dataset download complete."
