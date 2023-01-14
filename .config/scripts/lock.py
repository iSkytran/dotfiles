import os
import random
import socket
import subprocess

FOLDER_PATH = os.path.join("/home/entran/files/wallpapers", socket.gethostname())

def main():
    wallpapers = [os.path.join(FOLDER_PATH, file) for file in os.listdir(FOLDER_PATH)]
    if (socket.gethostname() == "cakebatter"):
        random.shuffle(wallpapers)
        subprocess.run(["swaylock", "--clock", "--indicator","-i", f"DP-3:{wallpapers.pop()}", "-i", f"DP-4:{wallpapers.pop()}"])
    elif (socket.gethostname() == "mintchip"):
        subprocess.run(["swaylock", "--clock", "--indicator","-i", random.choice(wallpapers)])

if __name__ == "__main__":
    main()
