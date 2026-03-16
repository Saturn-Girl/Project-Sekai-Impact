from ursina import *
import ctypes
import platform

app = Ursina()

def LoadLibrary():
    if platform.system() == "Windows":
        sekai = ctypes.CDLL("./ProjectSekaiImpact.dll")
    elif platform.system() == "Linux":
        sekai = ctypes.CDLL("./ProjectSekaiImpact.so")
    else:
        print("[ INFO ] : Unsupported platform. Please use windows or linux")

    HP = sekai.GetHP()
    print(f"[ INFO ] Got HP from dll/so {HP}")

def LoadModels():
    AuMicB_chan = Entity(
        model="models/AuMicroscopiiB_chan.fbx",
    )

def input(key):
    if key == "e":
        print("[ INFO ] editor camera mode")
        EditorCamera()

    if key == "ctrl+s":
        Sky()
if __name__ == "__main__":
    LoadLibrary()
    LoadModels()
    app.run()