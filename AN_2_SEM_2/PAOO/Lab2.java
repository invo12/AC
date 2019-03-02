import java.util.ArrayList;
import java.util.Scanner;

public class Lab2 {

    public static void main(String[] args) {
        int[] a;
        int[] b;
        int[][] c;
        int n,m,opt,x;
        Scanner input = new Scanner(System.in);
        System.out.println("Dati optiunea");
        opt = input.nextInt();
        switch (opt)
        {
            case 1:
                n = input.nextInt();
                a = CitireRandom(n);
                AfisareVector(a);
                System.out.println("Minimul este: " + Minim(a));
                break;
            case 2:
                n = input.nextInt();
                m = input.nextInt();
                a = Citire(n);
                b = Citire(m);
                AfisareVector(a);
                AfisareVector(b);
                System.out.println("Intersectia: ");
                AfisareVector(Intersectie(a,b));
                break;
            case 3:
                n = input.nextInt();
                m = input.nextInt();
                a = Citire(n);
                b = Citire(m);
                AfisareVector(a);
                AfisareVector(b);
                System.out.println("Diferenta: ");
                AfisareVector(Diferenta(a,b));
            case 4:
                n = input.nextInt();
                a = CitireRandom(n);
                AfisareVector(a);
                System.out.println(Crescatoare(a) ? "e crescator" : "nu e crescator");
            case 5:
                n = input.nextInt();
                a = Citire(n);
                b = new int[1];
                CopierePozitive(a,b);
            case 6:
                n = input.nextInt();
                a = CitireRandom(n);
                AfisareVector(a);
                System.out.println("Vector cu patrate: ");
                AfisareVector(Patrate(a));
            case 7:
                n = input.nextInt();
                m = input.nextInt();
                c = citireRandomMat(n,m);
                AfisareMatrice(c);
                System.out.println("Suma de pe margini e: " + SumaMargini(c));
            case 8:
                n = input.nextInt();
                m = input.nextInt();
                c = citireRandomMat(n,m);
                AfisareMatrice(c);
                ProduseSumeMatrice(c);
            case 9:
                n = input.nextInt();
                m = input.nextInt();
                c = citireRandomMat(n,m);
                AfisareMatrice(c);
                System.out.println("dati valoarea de cautat: ");
                x = input.nextInt();
                System.out.println("Apare de " + Numarare(c,x) + " ori");
            case 10:
                n = input.nextInt();
                m = input.nextInt();
                c = citireRandomMatBin(n,m);
                AfisareMatrice(c);
                System.out.println("Nr maxim de 1 pe o linie este: " + NumarMaxim1(c));
            case 11:
                n = input.nextInt();
                m = input.nextInt();
                c = citireRandomMat(n,m);
                AfisareMatrice(c);
                System.out.println("Linia/Liniile cu cele mai multe valori nenule sunt: ");
                AfisareVector(LiniiNenule(c));
            case 12:
                n = input.nextInt();
                m = input.nextInt();
                c = citireRandomMat(n,m);
                AfisareMatrice(c);
                System.out.println("Linia/Liniile cu cele mai multe valori distincte sunt: ");
                AfisareVector(LiniiDistincte(c));
        }
    }

    public static int[] CitireRandom(int n) {
        int[] a = new int[n];
        for (int i = 0; i < n; ++i) {
            a[i] = (int) (Math.random() * 100);
        }
        return a;
    }
    public static int[] Citire(int n) {
        int[] a = new int[n];
        System.out.println("Cititi vectorul: ");
        Scanner input = new Scanner(System.in);
        for (int i = 0; i < n; ++i) {
            a[i] = input.nextInt();
        }
        return a;
    }
    public static void AfisareVector(int[] a) {
        for (int nr : a) {
            System.out.print(nr + " ");
        }
        System.out.println();
    }

    public static int[][] citireRandomMat(int n,int m) {
        int[][] a = new int[n][m];
        for (int i = 0; i < n; i++)
        {
            for (int j = 0; j < m; j++)
            {
                a[i][j] = (int) (Math.random() * 10);
            }
        }
        return a;
    }
    public static int[][] citireRandomMatBin(int n,int m) {
        int[][] a = new int[n][m];
        for (int i = 0; i < n; i++)
        {
            for (int j = 0; j < m; j++)
            {
                a[i][j] = ((int) (Math.random() * 10)) % 2;
            }
        }
        return a;
    }
    public static void AfisareMatrice(int[][] a) {
        for (int i = 0; i < a.length; i++)
        {
            for (int j = 0; j < a[i].length; j++)
            {
                System.out.print(a[i][j] + " ");
            }
            System.out.println();
        }
    }

    public static int Minim(int[] a) {
        int min = a[0];
        for (int i = 1; i < a.length; ++i) {
            if (min > a[i]) {
                min = a[i];
            }
        }
        return min;
    }

    public static int[] Intersectie(int[] A,int[] B) {
        ArrayList<Integer> a = new ArrayList<Integer>();
        for(int i = 0;i < A.length;++i)
        {
            a.add(A[i]);
        }
        for(int i = 0;i < B.length;++i)
        {
            if(!a.contains(B[i]))
                a.add(B[i]);
        }

    return ArrayFromArrayList(a);
    }

    public static int[] Diferenta(int[] A,int[] B) {
        ArrayList<Integer> a = new ArrayList<Integer>();
        boolean ok;
        for(int i = 0;i < A.length;++i)
        {
            ok = true;
            for(int j = 0;j < B.length;++j)
            {
                if(A[i] == B[j])
                {
                    ok = false;
                    break;
                }
            }
            if(ok)
                a.add(A[i]);
        }
        return ArrayFromArrayList(a);
    }

    public static int[] ArrayFromArrayList(ArrayList<Integer> a) {
        int[] b = new int[a.size()];
        for(int i = 0;i < a.size();++i)
        {
            b[i] = a.get(i);
        }
        return b;
    }

    public static boolean Crescatoare(int[] a) {
        for(int i = 0;i < a.length - 1;++i)
        {
            if(a[i] > a[i+1])
                return false;
        }
        return true;
    }

    public static void CopierePozitive(int[] a,int[] b) {
        int index = 0;
        for (int i = 0; i < a.length; ++i) {
            if (a[i] > 0)
                index++;
        }
        b = new int[index];
        for (int i = 0,j = 0; i < a.length; ++i) {
            if(a[i] > 0) {
                b[j] = a[i];
                ++j;
            }
        }
        System.out.println("Valorile pozitive: ");
        AfisareVector(b);
    }

    public static  int[] Patrate(int[] a) {
        int index = 0;
        for (int i = 0; i < a.length; ++i) {
            if (Math.sqrt(a[i]) == (int)Math.sqrt(a[i]))
                index++;
        }
        int[] b = new int[index];
        for (int i = 0,j = 0; i < a.length; ++i) {
            if (Math.sqrt(a[i]) == (int)Math.sqrt(a[i]))
            {
                b[j] = a[i];
                ++j;
            }
        }
        return  b;
    }

    public static int SumaMargini(int[][] a) {
        int s = 0;
        for(int i = 0;i < a.length;++i)
        {
            s+=a[i][0];
            s+= a[i][a[0].length - 1];
        }
        for(int i = 1;i < a[0].length - 1;++i)
        {
            s+=a[0][i];
            s+=a[a.length-1][i];
        }
        return s;
    }

    public static int Numarare(int[][] a,int x) {
        int index = 0;
        for (int i = 0; i < a.length; i++)
        {
            for (int j = 0; j < a[i].length; j++)
            {
                if(a[i][j] == x)
                    index++;
            }
        }
        return  index;
    }

    public static int NumarMaxim1(int[][] a) {
        int max = 0,contor = 0;
        for (int i = 0; i < a.length; i++)
        {
            contor = 0;
            for (int j = 0; j < a[i].length; j++)
            {
                if(a[i][j] == 1)
                    contor++;
            }
            if(contor > max)
                max = contor;
        }
        return  max;
    }

    public static int[] LiniiNenule(int[][] a) {
        int max = 0,contor = 0,index = 0;
        ArrayList<Integer> c = new ArrayList<Integer>();
        for (int i = 0; i < a.length; i++)
        {
            contor = 0;
            for (int j = 0; j < a[i].length; j++)
            {
                if(a[i][j] != 0)
                    contor++;
            }
            if(contor > max)
                max = contor;
        }
        for (int i = 0; i < a.length; i++)
        {
            contor = 0;
            for (int j = 0; j < a[i].length; j++)
            {
                if(a[i][j] != 0)
                    contor++;
            }
            if(contor == max)
                c.add(i);
        }
        return  ArrayFromArrayList(c);
    }

    public static int[] LiniiDistincte(int[][] a) {
        boolean dist;
        int contor,max = 0;
        ArrayList<Integer> mem = new ArrayList<>();
        ArrayList<Integer> valMax = new ArrayList<>();
        for(int i = 0;i < a.length;++i)
        {
            contor = 0;
            for(int j = 0;j < a[i].length;++j)
            {
                dist = true;
                for(int k = 0;k < a[i].length;++k)
                {
                    if(j == k)
                        continue;
                    if(a[i][j] == a[i][k])
                        dist = false;
                }
                if(dist)
                    contor++;
            }
            if(max < contor)
                max = contor;
            mem.add(contor);
        }
        for(int i = 0;i < a.length;++i)
        {
            if(mem.get(i) == max)
                valMax.add(i);
        }
        return ArrayFromArrayList(valMax);
    }

    public static void ProduseSumeMatrice(int[][] a){
        int prod = 1,suma = 0,nrPoz = 0,nrNeg = 0,nrNule = 0;
        ArrayList<Integer> b = new ArrayList<>();
        boolean didProd = false;
        for(int i = 0;i < a.length;++i)
        {
            for(int j = 0;j < a[i].length;++j)
            {
                if((i+1) % 2 == 0 && ((j+1) % 2 == 1) && a[i][j] > 0)
                {
                    prod = prod * a[i][j];
                    didProd = true;
                }
                if(a[i][j] > 0 && (a[i][j] % 2 == 1))
                {
                    suma = suma+a[i][j];
                }
                if(a[i][j] > 0)
                {
                    nrPoz++;
                }
                else if(a[i][j] < 0)
                {
                    nrNeg++;
                }
                else
                {
                    nrNule++;
                }
                if((i+1) % 2 == 1 && ((j+1) % 3 == 0))
                {
                    b.add(a[i][j]);
                }
            }
        }
        System.out.println("produsul: " + (didProd ? prod : 0));
        System.out.println("suma: " + suma);
        System.out.println("Numar pozitive: " + nrPoz + " Numar negative: " + nrNeg + " Numar nule: " + nrNule);
        System.out.println("Elemente");
        AfisareVector(ArrayFromArrayList(b));
    }
}
