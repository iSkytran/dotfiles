import os
import random
import socket
import subprocess

FOLDER_PATH = os.path.join("/home/entran/files/wallpapers", socket.gethostname())

def main():
    if (socket.gethostname() == "cakebatter"):
        left_path = os.path.join(FOLDER_PATH, "left_monitor")
        right_path = os.path.join(FOLDER_PATH, "right_monitor")
        left_wallpaper = random.choice([os.path.join(left_path, file) for file in os.listdir(left_path)])
        right_wallpaper = random.choice([os.path.join(right_path, file) for file in os.listdir(right_path)])
        subprocess.call(["swaylock", "--clock", "--indicator","-i", f"DP-3:{left_wallpaper}", "-i", f"DP-4:{right_wallpaper}"])
    elif (socket.gethostname() == "mintchip"):
        wallpaper = random.choice([os.path.join(FOLDER_PATH, file) for file in os.listdir(FOLDER_PATH)])
        subprocess.call(["swaylock", "--clock", "--indicator","-i", wallpaper])

if __name__ == "__main__":
    main()
