# ------------------------------------------------------------
# File: TkTextScroll.py
# Developed by: Erick Barrantes
# Project: FunSkills-[Compiler]
# version: 1.0
# last edited by: Erick Barrantes:: 13/10/19 22.24
#
# Description: Wrapper class for Tkinter frame widget, that
#              contains a TextBox widget with a scrollbar
#              and a line number counter.
#
# TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
# ------------------------------------------------------------

from tkinter import ttk, Frame, Text, Canvas


class TkTextScroll():

    def __init__(self, master, height, width, x_pos, y_pos, with_line_numbers):
        self.text_frame = self.set_frame_container(master, height, width, x_pos, y_pos)
        self.scroll_text = self.set_scroll_text()
        self.line_numbers = TextLineNumbers(self.text_frame, width=15)
        self.line_numbers.attach(self.scroll_text)
        if with_line_numbers:
            self.set_line_numbers()

    def set_frame_container(self, master, height, width, x_pos, y_pos):
        text_frame = Frame(master, height=height, width=width)
        text_frame.grid_rowconfigure(0, weight=1)
        text_frame.grid_columnconfigure(0, weight=1)
        text_frame.grid_propagate(False)
        text_frame.place(x=x_pos, y=y_pos)
        return text_frame

    def set_scroll_text(self):
        scroll_text = CustomText(self.text_frame)

        self.text_frame.columnconfigure(0, weight=0)
        self.text_frame.columnconfigure(1, weight=1)
        scroll_text.grid(row=0, column=1, sticky="nsew")
        scrollbar = ttk.Scrollbar(self.text_frame, command=scroll_text.yview)
        scrollbar.grid(row=0, column=2, sticky="nsew")
        scroll_text['yscrollcommand'] = scrollbar.set

        scroll_text.bind("<<Change>>", self._on_change)
        scroll_text.bind("<Configure>", self._on_change)
        scroll_text.insert("end", "")

        return scroll_text

    def set_line_numbers(self):
        self.line_numbers.grid(row=0, column=0, sticky="nsew")

    def set_font(self, font, size):
        self.scroll_text.config(font=(font, size), undo=True, wrap='word')

    def _on_change(self, event):
        self.line_numbers.redraw()


class TextLineNumbers(Canvas):
    def __init__(self, *args, **kwargs):
        Canvas.__init__(self, *args, **kwargs)
        self.text_widget = None

    def attach(self, text_widget):
        self.text_widget = text_widget

    def redraw(self, *args):
        '''redraw line numbers'''
        self.delete("all")

        i = self.text_widget.index("@0,0")
        while True :
            d_line= self.text_widget.dlineinfo(i)
            if d_line is None: break
            y = d_line[1]
            line_num = str(i).split(".")[0]
            self.create_text(2,y,anchor="nw", text=line_num)
            i = self.text_widget.index("%s+1line" % i)


class CustomText(Text):
    def __init__(self, *args, **kwargs):
        Text.__init__(self, *args, **kwargs)

        # create a proxy for the underlying widget
        self._orig = self._w + "_orig"
        self.tk.call("rename", self._w, self._orig)
        self.tk.createcommand(self._w, self._proxy)

    def _proxy(self, *args):
        # let the actual widget perform the requested action
        cmd = (self._orig,) + args
        try:
            result = self.tk.call(cmd)
        except Exception:
            return None

        # generate an event if something was added or deleted,
        # or the cursor position changed
        if (args[0] in ("insert", "replace", "delete") or
            args[0:3] == ("mark", "set", "insert") or
            args[0:2] == ("xview", "moveto") or
            args[0:2] == ("xview", "scroll") or
            args[0:2] == ("yview", "moveto") or
            args[0:2] == ("yview", "scroll")
        ):
            self.event_generate("<<Change>>", when="tail")

        # return what the actual widget returned
        return result
