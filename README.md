# Video Compression Batch Script
This batch script compresses video files using ffmpeg with CUDA hardware acceleration. It provides three compression presets to choose from: Low, High, and Ultra compression.

# Requirements
* FFmpeg installed and added to your system's PATH.
* A CUDA-compatible GPU for hardware acceleration ***(optional)***

# Usage
## 1. **Download the Script**

Download the `FFMPEGCOMPRESS.bat` file and place it in a folder on your computer.

## 2. **Add Videos**

Drag and drop any video files you want to compress into the same folder as the FFMPEGCOMPRESS.bat file. The script supports `.mp4, .avi, .mov, and .mkv` formats.

## 3. **Run the Script**

Double-click the `FFMPEGCOMPRESS.bat` file to execute it. You will be prompted to choose a compression preset:

* **Low compression**: ``Smaller file size, lower quality.``
* **High compression**: ``Balanced file size and quality.``
* **Ultra compression**: ``Larger file size, higher quality.``
## 4. **Compression Process**

The script will process all video files in the directory, compressing them according to the chosen preset. Compressed files will be named with the appropriate suffix `(_low, _high, or _ultra)`.

## 5. **Output**

A folder named **Compressed** will be created in the same directory, and all compressed files will be moved to this folder.

## 6. **Completion**

Once all videos have been compressed and moved, a message will appear indicating that the process is complete.

# License
This project is licensed under the MIT License. See the LICENSE file for details.
