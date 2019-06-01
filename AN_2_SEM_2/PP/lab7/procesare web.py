import requests
import re

class HTMLFormat:
    def GetListOf(self, extension):
        pass
    def GetExtList(self):
        pass
    def GetItems(self):
        pass

class BasicURL:
    def __init__(self, url, content):
        self.url = url
        self.content = content
        items = url.split('/')
        self.root = items[0] + '//' + items[2] + '/'

    def BuildAbsURL(self, relative):
        return self.root + relative

    def GetRefList(self):
        first_list = self.content.split('=')
        second_list = []
        for item in first_list:
            temp = item.split('"')
            for rel in temp:
                if len(rel) > 0:
                    second_list += [rel]
        return second_list

    def GetListOf(self, extension):
        lista = self.GetRefList()
        collection = []
        for item in lista:
            for ext in extension:
                if ext in item and not '<' in item and not '>' in item:
                    collection += [self.BuildAbsURL(item)]
                    break
        return collection

class ArchFormat(HTMLFormat, BasicURL):
    def __init__(self, url, content):
        super().__init__(url, content)
        self.extension = ('.zip', '.7z', '.rar', '.bz2')
        self.items = BasicURL.GetListOf(self, self.extension)

    def GetExtList(self):
        return self.extension

    def GetItems(self):
        return self.items

class PictureFormat(HTMLFormat, BasicURL):
    def __init__(self, url, content):
        super().__init__(url, content)
        self.extension = ('.bmp', '.png', '.jpg', '.jpeg', '.gif', '.ico')
        self.items = BasicURL.GetListOf(self, self.extension)

    def GetExtList(self):
        return self.extension

    def GetItems(self):
        return self.items

class DocumentFormat(HTMLFormat, BasicURL):
    def __init__(self, url, content):
        super().__init__(url, content)
        self.extension = ('.txt', '.pdf', '.doc', '.docx', '.ppt', '.pptx')
        self.items = BasicURL.GetListOf(self, self.extension)

    def GetExtList(self):
        return self.extension

    def GetItems(self):
        return self.items

class RegExtract:
    def __init__(self,ext,url):
        ext = ext.replace(".","")
        self.fileName = re.findall("[0-9A-Za-z\-_\.?]*\."+ext, url)
        self.pathName = re.findall("[0-9A-Za-z\-_]*/[0-9A-Za-z\-_\.]*\."+ext, url)
#-------------------------------------------------------------------------------------s

def main():
    extensions = dict(dict(tuple()))
    files = dict(tuple(()))
    url = 'https://www.7-zip.org/download.html'
    r = requests.get(url)
    #print(r.content)
    print('Archives:')
    arch = ArchFormat(url, r.text)
    print(arch.GetExtList())
    for j in arch.GetExtList():
        for i in arch.GetItems():
            if j in i:
                f = RegExtract(j,i).fileName[0]
                p = RegExtract(j,i).pathName[0]
                t = (p,i)
                files[f] = t
        if bool(files):
            extensions[j] = files
        files = dict(tuple())
    print('Pictures')
    pict = PictureFormat(url, r.text)
    for j in pict.GetExtList():
        for i in pict.GetItems():
            if j in i:
                f = RegExtract(j, i).fileName[0]
                p = RegExtract(j, i).pathName[0]
                t = (p, i)
                files[f] = t
        if bool(files):
            extensions[j] = files
        files = dict(tuple())
    print('Documents:')
    docs = DocumentFormat(url, r.text)
    for j in docs.GetExtList():
        for i in docs.GetItems():
            if j in i:
                f = RegExtract(j, i).fileName[0]
                p = RegExtract(j, i).pathName[0]
                t = (p, i)
                files[f] = t
        if bool(files):
            extensions[j] = files
        files = dict(tuple())
    print("\n")
    print(extensions)

if __name__ == '__main__':
    main()