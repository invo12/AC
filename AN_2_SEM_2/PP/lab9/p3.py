import os
import datetime

class Token:
    def __init__(self, token, term):
        self.token = token
        self.term = term
    #suprascrisa de Operator si Operand

    def IsNonTerm(self):
        pass

    def GetData(self):
        return self.token


class Log:
    instanta = None
    name = None

    def __init__(self, fname):
        if not Log.instanta:
            Log.name=os.path.dirname(os.path.realpath(__file__))+'\\'+fname
            print('Log:['+Log.name+']')
            Log.instanta=self
            if os.path.isfile(Log.name):
                f=open(self.name, "a+")
                f.write("Continuing file from previous run\n")
                f.close()
            else:
                f=open(self.name, "w+")
                f.close()

    def Write(self, line):
        f=open(self.name, "a+")
        try:
            f.write(str(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))+' -> '+line)
            f.write('\n')
        finally:
            f.close()

    @staticmethod
    def GetInstanta():
        if not Log.instanta:
            return Log()
        return Log.instanta


class Operator(Token):
    def __init__(self, token):
        super().__init__(token, False)

    def IsNonTerm(self): #operatorii intr-un arbore AST sunt NON-TERMINALI (noduri intermediare)
        return True


class Operand(Token):
    def __init__(self, token):
        super().__init__(token, True)

    def IsNonTerm(self): #operanzii intr-un arbore AST sunt TERMINALI (noduri frunza)
        return False

class ASTNode:
    def __init__(self,data,left,right):
        self.Data = data
        self.Left = left
        self.Right = right

class AST:
    def __init__(self):
        self.stiva = []
        self.root = None
    #aceasta functie trebuie modificata pentru a permite prioritati intre operatori
    #hint: daca un operator cu prioritate mai mare (*) este mai aproape de radacina in AST fata de un operator nou cu prioritate mai mica, se inverseaza sub-arborii

    def AddASTNode(self, token):
        op1 = self.stiva.pop(0)
        op2 = self.stiva.pop(0)
        self.stiva.insert(0,ASTNode(token,op2,op1))

    def AcceptVisitor(self, printvisitor):
        printvisitor.visit(self.root)


class ASTBuilder:
    Left = None
    Right = None

    def __init__(self, expresie, ast):
        self.expresie = expresie
        self.stivaOp = []
        self.sym = []
        self.Parse()
        self.ListSymbols()
        self.ast = ast
        for tok in self.sym:
            if not tok.IsNonTerm():
                ast.stiva.insert(0,ASTNode(tok,None,None))
            else:
                if self.stivaOp == []:
                    self.stivaOp.append(tok)
                elif tok.GetData() == '*' or tok.GetData() == '/':
                    a = self.stivaOp.pop()
                    if a.GetData() == '+' or a.GetData() == '-':
                        self.stivaOp.append(a)
                    else:
                        while self.stivaOp != [] and a.GetData() != '+' and a.GetData() != '-':
                            ast.AddASTNode(a)
                            a = self.stivaOp.pop()
                        if a.GetData() == '+' or a.GetData() == '-':
                            self.stivaOp.append(a)
                        else:
                            ast.AddASTNode(a)
                    self.stivaOp.append(tok)
                elif tok.GetData() == '+' or tok.GetData() == '-':
                    a = self.stivaOp.pop()
                    while self.stivaOp != []:
                        ast.AddASTNode(a)
                        a = self.stivaOp.pop()
                    ast.AddASTNode(a)
                    self.stivaOp.append(tok)
        if self.stivaOp != []:
            a = self.stivaOp.pop()
            while self.stivaOp != []:
                ast.AddASTNode(a)
                a = self.stivaOp.pop()
            ast.AddASTNode(a)
        ast.root = ast.stiva.pop()


    def Parse(self):
        nr = 0
        was_nr = False
        for chr in self.expresie:
            if chr >= '0' and chr <= '9':
                nr *= 10
                nr += int(chr)
                was_nr = True
            elif chr in ['+', '-', '*', '/']:
                if was_nr:
                    self.sym += [Operand(nr)]
                    was_nr = False
                    nr = 0
                self.sym += [Operator(chr)]
        if was_nr:
            self.sym += [Operand(nr)]
            was_nr = False
            nr = 0

    def ListSymbols(self):
        a=Log.GetInstanta()
        print('Din expresia data am extras urmatoarele elemente:')
        a.Write('Din expresia data am extras urmatoarele elemente:')
        for item in self.sym:
            if item.IsNonTerm():
                print(item.GetData(), '\t->\tOperator')
                a.Write(str(item.GetData())+'\t->\tOperator')
            else:
                print(item.GetData(), '\t->\tOperand')
                a.Write(str(item.GetData())+ '\t->\tOperand')


class PrintVisitor:
    def visit(self, ast):
        pass


class VisitPreOrdine(PrintVisitor):
    def visit(self, ast):
        print(ast.Data.GetData(),end="")
        if ast.Left is not None:
            self.visit(ast.Left)
        if ast.Right is not None:
            self.visit(ast.Right)


class VisitInOrdine(PrintVisitor):
    def visit(self, ast):
        if ast.Left is not None:
            self.visit(ast.Left)
        print(ast.Data.GetData(),end="")
        if ast.Right is not None:
            self.visit(ast.Right)


class VisitPostOrdine(PrintVisitor):
    def visit(self, ast):
        if ast.Left is not None:
            self.visit(ast.Left)
        if ast.Right is not None:
            self.visit(ast.Right)
        print(ast.Data.GetData(),end="")

class VisitCalcul(PrintVisitor):

    def __init__(self):
        self.stiva = []

    def operatie(self,op):
        a = self.stiva.pop()
        b = self.stiva.pop()
        if op == '+':
            return b+a
        elif op == '-':
            return b - a
        elif op == '*':
            return b * a
        elif op == '/':
            return b / a
    def evalueaza(self,ast):
        if ast.Left is not None:
            self.evalueaza(ast.Left)
        if ast.Right is not None:
            self.evalueaza(ast.Right)
        if ast.Left is None and ast.Right is None:
            self.stiva.append(ast.Data.GetData())
        else:
            self.stiva.append(self.operatie(ast.Data.GetData()))

    def visit(self,ast):
        self.evalueaza(ast)
        a=self.stiva.pop()
        print(a)
        Log.GetInstanta().Write("Rezultat="+str(a))
#class Calcul(PrintVisitor):
#   def calc(self,expresie):
#      clc = eval(expresie)
#     print(clc)


def main():
    log=Log('log.txt')
    str='3*4-5+12-12/3'
    log.Write(str)
    ast = AST()
    a = ASTBuilder(str, ast)

    pre = VisitPreOrdine()
    ast.AcceptVisitor(pre)
    print()
    iin = VisitInOrdine()
    ast.AcceptVisitor(iin)
    print()
    post = VisitPostOrdine()
    ast.AcceptVisitor(post)
    print()
    print("Rezultatul expresiei este",end=" ")
    clc = VisitCalcul()
    ast.AcceptVisitor(clc)

if __name__ == "__main__":
    main()
