import customtkinter
from color_picker_widget import VIMColorPicker

root = customtkinter.CTk()
selected_color = None

def get_color(color):
    global selected_color
    selected_color = color

def accept_color(event):
    print(selected_color, end="")
    root.destroy()

def close_window(event):
    root.destroy()

root.title("NVIMColorPicker")
root.bind('<Escape>', close_window)
root.bind('<Return>', accept_color)

colorpicker = VIMColorPicker(root, width=500, command=get_color)
colorpicker.pack(padx=10, pady=10)

root.mainloop()

