import math
import time
import tkinter as tk

class Ceas(tk.Frame):
    def __init__(self, master=None):
        #lungime fereastra
        self.w = 500
        #inaltime fereastra
        self.h = 500
        tk.Frame.__init__(self, master)
        self.master = master
        #construim un canvas pentru desenat
        self.ceas = tk.Canvas(self, width = self.w, height = self.h)
        #plasam canvas-ul pe fereastra in coltul stanga sus
        self.ceas.place(x = 0, y = 0)
        #initializam aplicatia
        self.init_window()

    def init_window(self):
        self.master.title("PP LAB-7, P2")
        self.pack(fill=tk.BOTH, expand=1)
        #buton suplimentar de inchidere
        quitButton = tk.Button(self, text="Inchide", command=self.client_exit)
        #il plasam inafara suprafetei de desenare
        quitButton.place(x=510, y=50)
        resetButton = tk.Button(self,text="Set Hour",command=lambda:self.setHour(self.hourField.get(),self.minuteField.get(),self.secondField.get()))
        resetButton.place(x=720,y=80)

        self.hourField = tk.Entry(self)
        self.hourField.place(x = 510,y=80,width=60)

        self.minuteField = tk.Entry(self)
        self.minuteField.place(x=580, y=80, width=60)

        self.secondField = tk.Entry(self)
        self.secondField.place(x=650, y=80, width=60)

        self.start = False
        self.num = 0
        self.startCronometru = tk.Button(self,text="start/stop",command = self.cronometru)
        self.startCronometru.place(x = 510,y = 130,width = 60)

        #apelam rutina de actualizare a ceasului
        self.setHour(23,59,0)
        self.UpdateClock()

    def UpdateClock(self):
        #curatam canvas-ul
        self.ceas.create_rectangle(0, 0, self.w, self.h, fill="#FFFFFF")
        #reactualizam variabilele care indica ora
        self.sec+=1
        if(self.sec >= 60):
            self.sec -= 60
            self.min += 1
            if(self.min >= 60):
                self.min -= 60
                self.ora = (self.ora + 1)%24
        if self.start:
            self.num += 1
        #redesenam ceasul ca acele sa indice noua configuratie
        self.DeseneazaCeas(self.w, self.h, self.ora, self.min, self.sec)
        #la fiecare secunda, reapelam aceasta functie pentru update
        self.after(1000, self.UpdateClock)

    def DeseneazaCeas(self, w, h, hh, mm, ss):
        #construim un cerc
        self.ceas.create_oval(10,10,w-10,h-10)
        XCentru = w / 2
        YCentru = h / 2
        Raza = (w+h) / 4 - 50
        #deoarece un cerc trigonometric are 0 grade la ora 3, rotim cifrele sa corespunda cu gradele acestora in cerc
        #        0 30 60 90 120 150 180 210 240 270 300 330
        cifre = (3, 4, 5, 6, 7,  8,  9, 10, 11, 12,  1,  2)
        #punctele rosii aferente minutelor principale + numerele in format text
        for i in range(12):
            #construim coordonatele punctelor rosii care indica minutele divizibile cu 5, respectiv textul aferent acestor grupuri
            xNr = XCentru + Raza * math.cos(self.ToRadiani(30 * i))
            yNr = YCentru + Raza * math.sin(self.ToRadiani(30 * i))
            xPt = XCentru + (Raza + 30) * math.cos(self.ToRadiani(30 * i))
            yPt = YCentru + (Raza + 30) * math.sin(self.ToRadiani(30 * i))
            #culoarea este un string hex similar cu valorile HTML, "#FF0000" = red   culorile sunt hex RGB -> RRGGBB
            self.ceas.create_text(xNr, yNr, fill="#800080", text=str(cifre[i]), font = 'Helvetica 18 bold')
            self.ceas.create_oval(xPt - 5, yPt - 5, xPt + 5, yPt + 5, fill = "#FF0000")

        #liniile care indica minutele
        grad_minut = 360 / ( 5 * 12)
        Rinterior = (w+h) / 4 - 30
        Rexterior = (w+h) / 4 - 20
        # construim coordonatele liniilor care indica minutele (orientarea trebuie sa fie cerc_interior -> cerc_exterior), altfel ar arata ciudat
        for i in range(60):
            if i>0 and i % 5 != 0:
                x1 = XCentru + Rinterior * math.cos(self.ToRadiani(grad_minut * i))
                y1 = YCentru + Rinterior * math.sin(self.ToRadiani(grad_minut * i))
                x2 = XCentru + Rexterior * math.cos(self.ToRadiani(grad_minut * i))
                y2 = YCentru + Rexterior * math.sin(self.ToRadiani(grad_minut * i))
                self.ceas.create_line(x1,y1,x2,y2, fill="#0000FF", width = 3)

        #centrul ceasului
        self.ceas.create_oval(w / 2 - 10, h / 2 - 10, w / 2 + 10, h / 2 + 10, fill="#FFFF00")

        #PP Lab7 Label
        self.ceas.create_text(self.w / 2, self.h / 2 + 30, fill = "#FF8000", text="Paradigme de Programare L7", font = "Times 20 italic bold")

        #desenam acele care indica ora
        self.DeseneazaAc(1, hh, mm)
        self.DeseneazaAc(2, mm, ss)
        self.DeseneazaAc(3, ss)

    def cronometru(self):
        self.start = not self.start
        if not self.start:
            print("Au trecut " + str(self.num) + " secunde")
            self.num = 0
    def setHour(self,hh,mm,ss):
        try:
            self.ora = int(hh)
            self.min = int(mm)
            self.sec = int(ss)
        except:
            self.ora = 0
            self.min = 0
            self.sec = 0

    def DeseneazaAc(self, tip, indicator, indicator2 = 0):
        grad_minut = 360 / (5 * 12)
        x1 = self.w / 2
        y1 = self.h / 2
        if tip == 1:
            #unghiul acului care indica ora, trebuie pozitionat si in functie de minut, indicator2 este minutul, iar pentru 60 minute, orarul face maxim 30 grade
            unghi = self.ToRadiani(((indicator % 12) * 5 * grad_minut + indicator2 * (30 / 60) + 270) % 360)
            scale = 8
            x2 = self.w / 2 + ((self.w + self.h) / scale) * math.cos(unghi)
            y2 = self.h / 2 + ((self.w + self.h) / scale) * math.sin(unghi)
            self.ceas.create_line(x1, y1, x2, y2, fill="#000000", width = 7)
        elif tip == 2:
            #unghiul acului care indica minutul, trebuie pozitionat si in functie de secunda, indicator2 este secunda, iar pentru 60 secunde, minutarul face maxim 6 grade
            #adica distanta intre 2 minute pe cerc
            unghi = self.ToRadiani(((indicator % 60) * grad_minut + indicator2 * (6 / 60) + 270) % 360)
            scale = 6
            x2 = self.w / 2 + ((self.w + self.h) / scale) * math.cos(unghi)
            y2 = self.h / 2 + ((self.w + self.h) / scale) * math.sin(unghi)
            self.ceas.create_line(x1, y1, x2, y2, fill="#008000", width = 3)
        elif tip == 3:
            #secundarul se misca doar intre liniutele care arata minutele/secundele
            unghi = self.ToRadiani(((indicator % 60) * grad_minut + 270) % 360)
            scale = 5.5
            x2 = self.w / 2 + ((self.w + self.h) / scale) * math.cos(unghi)
            y2 = self.h / 2 + ((self.w + self.h) / scale) * math.sin(unghi)
            self.ceas.create_line(x1, y1, x2, y2, fill="#FF0000")

    #functie pentru conversie din grade in radiani, math.sin() / math.cos() primesc parametri radiani, nu grade
    def ToRadiani(self, unghi):
        return unghi * math.pi / 180

    def client_exit(self):
        exit()

#instanta la Tk
root = tk.Tk()
#stabilim dimensiunea ferestrei
root.geometry("800x500")
#derivam Tk in Ceas
app = Ceas(root)
#bucla de procesare evenimente
root.mainloop()