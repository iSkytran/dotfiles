import itertools
import time
import os
import socket
import subprocess

FOLDER_PATH = os.path.join("/home/entran/files/wallpapers", socket.gethostname())

def change_wallpaper(wallpaper: str):
    subprocess.call(["swww", "img", wallpaper, "--transition-duration", "1", "--transition-type", "random"])

def main():
    time.sleep(1)
    wallpapers = itertools.cycle([os.path.join(FOLDER_PATH, file) for file in os.listdir(FOLDER_PATH)])
    change_wallpaper(next(wallpapers))
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
        signature = os.getenv("HYPRLAND_INSTANCE_SIGNATURE")
        client.connect(f"/tmp/hypr/{signature}/.socket2.sock")
        fd = client.makefile()
        while True:
            line = fd.readline()
            if line[0:9] == "workspace":
                change_wallpaper(next(wallpapers))

if __name__ == "__main__":
    main()
