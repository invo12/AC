import os

if __name__ == "__main__":
    numeDirector = input()
    for root,subdirs,files in os.walk(numeDirector):
        for file in os.listdir(root):
            filePath = os.path.join(root,file)
            if os.path.isdir(filePath):
                pass
            else:
                f = open(filePath,'rb')
                try:
                    list = []
                    frecv = []
                    content = f.read()
                    for i in range(0,256):
                        c = content.count(i)
                        list.append(tuple((i,c)))
                    total = sum(pair[1] for pair in list)
                    for i in list:
                        frecv.append(i[1]/total)
                    tip = 3
                    for i in range(0,256):
                        if frecv[i] > 0.005:
                            tip = 0
                            break
                    if tip == 0:
                        tip = 2
                        if(frecv[0] < 0.3):
                            tip = 0
                    if tip == 0:
                        tip = 1

                    print(tip)
                finally:
                    f.close()