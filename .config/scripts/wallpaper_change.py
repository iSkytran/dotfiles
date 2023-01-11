import itertools
import os
import socket
import subprocess
import time
import threading

FOLDER_PATH = os.path.join("/home/entran/files/wallpapers", socket.gethostname())
TIMER_DELAY = 0.75 

def change_cakebatter_wallpaper(left_wallpaper: str, right_wallpaper: str):
    subprocess.run(["swww", "img", "-o", "DP-3", left_wallpaper, "--transition-duration", "1", "--transition-type", "random"])
    subprocess.run(["swww", "img", "-o", "DP-4", right_wallpaper, "--transition-duration", "1", "--transition-type", "random"])

def change_mintchip_wallpaper(wallpaper: str):
    subprocess.run(["swww", "img", wallpaper, "--transition-duration", "1", "--transition-type", "random"])

def main():
    time.sleep(1)
    if (socket.gethostname() == "cakebatter"):
        left_path = os.path.join(FOLDER_PATH, "left_monitor")
        right_path = os.path.join(FOLDER_PATH, "right_monitor")
        left_wallpapers = itertools.cycle([os.path.join(left_path, file) for file in os.listdir(left_path)])
        right_wallpapers = itertools.cycle([os.path.join(right_path, file) for file in os.listdir(right_path)])
        change_cakebatter_wallpaper(next(left_wallpapers), next(right_wallpapers))
    elif (socket.gethostname() == "mintchip"):
        wallpapers = itertools.cycle([os.path.join(FOLDER_PATH, file) for file in os.listdir(FOLDER_PATH)])
        change_mintchip_wallpaper(next(wallpapers))
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
        signature = os.getenv("HYPRLAND_INSTANCE_SIGNATURE")
        client.connect(f"/tmp/hypr/{signature}/.socket2.sock")
        fd = client.makefile()
        if (socket.gethostname() == "cakebatter"):
            timer = threading.Timer(TIMER_DELAY, change_cakebatter_wallpaper, [next(left_wallpapers), next(right_wallpapers)])
            while True:
                line = fd.readline()
                if line[0:9] == "workspace":
                    timer.cancel()
                    timer = threading.Timer(TIMER_DELAY, change_cakebatter_wallpaper, [next(left_wallpapers), next(right_wallpapers)])
                    timer.start()
        elif (socket.gethostname() == "mintchip"):
            timer = threading.Timer(TIMER_DELAY, change_mintchip_wallpaper, next(wallpapers))
            while True:
                line = fd.readline()
                if line[0:9] == "workspace":
                    timer.cancel()
                    timer = threading.Timer(TIMER_DELAY, change_mintchip_wallpaper, [next(wallpapers)])
                    timer.start()

if __name__ == "__main__":
    main()
