import customtkinter
from color_picker_widget import VIMColorPicker

selected_color = None

root = customtkinter.CTk()

def get_color(color):
    global selected_color
    selected_color = color

def close_window(event):
    root.destroy()


root.title("NVIMColorPicker")
root.bind('<Escape>', close_window)
root.bind('<Return>', close_window)

colorpicker = VIMColorPicker(root, width=500, command=get_color)
colorpicker.pack(padx=10, pady=10)
root.mainloop()

print(selected_color, end="")
