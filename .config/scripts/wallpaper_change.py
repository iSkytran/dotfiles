import itertools
import os
import random
import socket
import subprocess
import time
import threading

FOLDER_PATH = os.path.join("/home/entran/files/wallpapers", socket.gethostname())
TIMER_DELAY = 0.75 

def change_wallpaper(set_list: list[tuple[str, str]]) -> None:
    for display, wallpaper in set_list:
        subprocess.run(["swww", "img", "-o", display, wallpaper, "--transition-duration", "1", "--transition-type", "random"])

def next_wallpaper(wallpapers: itertools.cycle) -> list[tuple[str, str]]:
    if (socket.gethostname() == "cakebatter"):
        return [("DP-3", next(wallpapers)), ("DP-4", next(wallpapers))]
    elif (socket.gethostname() == "mintchip"):
        return [("eDP-1", next(wallpapers))]
    else:
        raise Exception("Not a known device.")

def main():
    time.sleep(1)
    wallpapers = [os.path.join(FOLDER_PATH, file) for file in os.listdir(FOLDER_PATH)]
    random.shuffle(wallpapers)
    wallpapers = itertools.cycle(wallpapers)
    change_wallpaper(next_wallpaper(wallpapers))
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
        signature = os.getenv("HYPRLAND_INSTANCE_SIGNATURE")
        client.connect(f"/tmp/hypr/{signature}/.socket2.sock")
        fd = client.makefile()
        timer = threading.Timer(TIMER_DELAY, change_wallpaper, [next_wallpaper(wallpapers)])
        while True:
            line = fd.readline()
            if line[0:9] == "workspace":
                timer.cancel()
                timer = threading.Timer(TIMER_DELAY, change_wallpaper, [next_wallpaper(wallpapers)])
                timer.start()

if __name__ == "__main__":
    main()
