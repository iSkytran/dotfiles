import os
import random
import subprocess

FOLDER_PATH = "/home/entran/files/wallpapers"

def main():
        wallpaper = random.choice([os.path.join(FOLDER_PATH, file) for file in os.listdir(FOLDER_PATH)])
        subprocess.call(["swaylock", "--clock", "--indicator", "-i", wallpaper])

if __name__ == "__main__":
    main()

