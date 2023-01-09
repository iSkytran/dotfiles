import socket
import subprocess

lock_time = 300
suspend_time = 500
lock_path = "/home/entran/.config/scripts/lock.py"

def main():
    if (socket.gethostname() == "cakebatter"):
        subprocess.call(["swayidle", "-w", "timeout", f"{lock_time}", f"'python' '{lock_path}'"])
    elif (socket.gethostname() == "mintchip"):
        subprocess.call(["swayidle", "-w", "timeout", f"{lock_time}", f"'python' '{lock_path}'",
            "timeout", f"{suspend_time}", "'systemctl' 'suspend'",
            "before-sleep", f"'python' '{lock_path}'"])

if __name__ == "__main__":
    main()

