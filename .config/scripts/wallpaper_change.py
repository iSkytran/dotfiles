import itertools
import os
import socket
import subprocess
import time
import threading

FOLDER_PATH = os.path.join("/home/entran/files/wallpapers", socket.gethostname())
TIMER_DELAY = 0.75 

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
        timer = threading.Timer(TIMER_DELAY, change_wallpaper, next(wallpapers))
        while True:
            line = fd.readline()
            if line[0:9] == "workspace":
                timer.cancel()
                timer = threading.Timer(TIMER_DELAY, change_wallpaper, [next(wallpapers)])
                timer.start()

if __name__ == "__main__":
    main()
