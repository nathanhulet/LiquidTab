#!/bin/bash

# Remove venv if it exists
if [ -d "venv" ]; then
    echo "Removing existing venv..."
    rm -rf venv
fi

# Create new venv
echo "Creating new venv..."
python -m venv venv

# Activate venv
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install requirements
echo "Installing requirements..."
pip install -r requirements.txt

# Deactivate venv
deactivate

echo "Setup complete. To activate the virtual environment, run 'source venv/bin/activate'"

