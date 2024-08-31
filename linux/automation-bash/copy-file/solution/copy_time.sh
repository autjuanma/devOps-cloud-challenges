#!/bin/bash

# Author information
AUTHOR="[JuanTM 📲]"
EMAIL="juannodecoorp@gmail.com"
DATE="2024-30-24"

# Set the log file
LOG_FILE="copy_time.log"

# Create an empty file called `x` in `/tmp`
touch /tmp/x || echo "Error creating file x" >> $LOG_FILE

# Copy the `x` file to your home directory
cp /tmp/x ~/ || echo "Error copying file x" >> $LOG_FILE

# Create a copy of `x` file called `y`
cp ~/x ~/y || echo "Error creating file y" >> $LOG_FILE

# Create a directory called `files` and move `x` and `y` there
mkdir ~/files || echo "Error creating directory files" >> $LOG_FILE
mv ~/x ~/y ~/files/ || echo "Error moving files" >> $LOG_FILE

# Copy the directory "files" and name the copy `copy_of_files`
cp -r ~/files ~/copy_of_files || echo "Error copying directory files" >> $LOG_FILE

# Rename `copy_of_files` directory to `files2`
mv ~/copy_of_files ~/files2 || echo "Error renaming directory" >> $LOG_FILE

# Remove `files` and `files2` directories
rm -rf ~/files ~/files2 || echo "Error removing directories" >> $LOG_FILE