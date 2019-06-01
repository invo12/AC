import random

class Flower(object):
    def accept(self,visitor):
        visitor.visit(self)
    def pollinate(self,pollinator):
        print(self,"polenizata de ",pollinator)
    def eat(self,eater):
        print(self,"mancata de ",eater)
    def __str__(self):
        return self.__class__.__name__

class Gladiiola(Flower) : pass
class Trandafir(Flower) : pass
class Crizantema(Flower) : pass

class Visitor:
    def __str__(self):
        return self.__class__.__name__

class Bug(Visitor):pass
class Pollinator(Bug):pass
class Predator(Bug):pass

class Bee(Pollinator):
    def visit(self,flower):
        flower.pollinate(self)
class Fly(Pollinator):
    def visit(self,flower):
        flower.pollinate(self)
class Worm(Predator):
    def visit(self,flower):
        flower.eat(self)

def flowerGen(n):
    flwrs = Flower.__subclasses__()
    for i in range(n):
        yield random.choice(flwrs)()

bee = Bee()
fly = Fly()
worm = Worm()
for flower in flowerGen(10):
    flower.accept(bee)
    flower.accept(fly)
    flower.accept(worm)