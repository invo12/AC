from urllib.request import urlopen
import re
import urllib.request
from tkinter import *

class LinkColector:
    def submit(self,):
        self.url = self.e.get()
        self.e.quit()

    def __init__(self):
        root = Tk()
        root.geometry("200x50")
        self.e = Entry(root,width=50)
        self.e.place(x=30,y=0)
        Button(root,text = "Submit",command = self.submit).place(x=30,y = 20)
        root.mainloop()

    def collectLinks(self,val):
        with urllib.request.urlopen(self.url) as response:
            page = str(response.read())
        links = re.findall(str(val),page)
        return links

#poze
file1 = open("poze.txt","w")
file1.write("")
file1.close()
file1 = open("poze.txt","a")
links = LinkColector()
s = links.collectLinks("([0-9A-Za-z\-\_]*){1}\.(jpg|jpeg|png)")
print(s)
file1.write('\n'.join('{}.{}'.format(x[0],x[1]) for x in s))
file1.close()

#referite catre alte site-uri
file2 = open("referinte.txt","w")
file2.write("")
file2.close()
file2 = open("referinte.txt","a")
s = links.collectLinks("<a href=\"(.*?)\"")
print(s)
file2.write('\n'.join('{}'.format(x) for x in s))
file2.close()

#docs
file3 = open("docs.txt","w")
file3.write("")
file3.close()
file3 = open("docs.txt","a")
s = links.collectLinks("([0-9A-Za-z\-\_]*){1}\.(doc|pdf|txt)")
print(s)
file3.write('\n'.join('{}.{}'.format(x[0],x[1]) for x in s))
file3.close()