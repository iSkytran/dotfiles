import os
import subprocess

envvars = {
    "XDG_CURRENT_DESKTOP": "Hyprland",
    "XDG_SESSION_TYPE": "wayland",
    "SDG_SESSION_DESKTOP": "Hyprland",
    "XCURSOR_SIZE": "24",
    "SDL_VIDEODRIVER": "wayland",
    "_JAVA_AWT_WM_NONREPARENTING": "1",
    "GDK_BACKEND": "wayland",
    "MOZ_DBUS_REMOTE": "1",
    "MOZ_ENABLE_WAYLAND": "1",
    "GTK_IM_MODULE": "fcitx",
    "QT_IM_MODULE": "fcitx",
    "XMODIFIERS": "@im=null",
    "GLFW_IM_MODULE": "ibus"
}

def main():
    for key, value in envvars.items():
        os.environ[key] = value
    subprocess.call(["Hyprland"])

if __name__ == "__main__":
    main()

