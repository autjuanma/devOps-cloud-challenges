# Author information
$AUTHOR = "[JuanTM 📲]"
$EMAIL = "juannodecoorp@gmail.com"
$DATE = "2024-30-24"

# Set the log file
$LOG_FILE = "copy_time.log"

# Create an empty file called `x` in `/tmp`
New-Item -ItemType File -Path /tmp/x -ErrorAction SilentlyContinue
if (!$?) {
    "Error creating file x" | Add-Content -Path $LOG_FILE
}

# Copy the `x` file to your home directory
Copy-Item -Path /tmp/x -Destination ~/ -ErrorAction SilentlyContinue
if (!$?) {
    "Error copying file x" | Add-Content -Path $LOG_FILE
}

# Create a copy of `x` file called `y`
Copy-Item -Path ~/x -Destination ~/y -ErrorAction SilentlyContinue
if (!$?) {
    "Error creating file y" | Add-Content -Path $LOG_FILE
}

# Create a directory called `files` and move `x` and `y` there
New-Item -ItemType Directory -Path ~/files -ErrorAction SilentlyContinue
if (!$?) {
    "Error creating directory files" | Add-Content -Path $LOG_FILE
}
Move-Item -Path ~/x,~/y -Destination ~/files/ -ErrorAction SilentlyContinue
if (!$?) {
    "Error moving files" | Add-Content -Path $LOG_FILE
}

# Copy the directory "files" and name the copy `copy_of_files`
Copy-Item -Path ~/files -Destination ~/copy_of_files -Recurse -ErrorAction SilentlyContinue
if (!$?) {
    "Error copying directory files" | Add-Content -Path $LOG_FILE
}

# Rename `copy_of_files` directory to `files2`
Rename-Item -Path ~/copy_of_files -NewName files2 -ErrorAction SilentlyContinue
if (!$?) {
    "Error renaming directory" | Add-Content -Path $LOG_FILE
}

# Remove `files` and `files2` directories
Remove-Item -Path ~/files,~/files2 -Recurse -ErrorAction SilentlyContinue
if (!$?) {
    "Error removing directories" | Add-Content -Path $LOG_FILE
}