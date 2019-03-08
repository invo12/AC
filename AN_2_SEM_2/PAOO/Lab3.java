import java.io.*;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) throws IOException
    {
        String a = "",b = "";
        String[] d = new String[10];
        char c;
        int e;
        int[] f = new int[20];
        String[] g;
        String[] h;
        FileReader fr;

        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        /*1
        a = bf.readLine();
        b = bf.readLine();
        System.out.println("Apare de " + nrAparitii(a,b) + " ori");
        */

        /*2
        a = bf.readLine();
        c = (bf.readLine()).charAt(0);
        System.out.println("Sirul: " + Repunere(a,c));
        */

        /*3
        a = bf.readLine();
        d = splitJMK(a);
        System.out.println(d[0] + ' ' + d[1] +' '+ d[2]);
        */

        /*4
        a = bf.readLine();
        System.out.println(literaMareCuvant(a));
        */

        /*5
        a = bf.readLine();
        System.out.println(nrVocale(a));
        */

        /*6
        a = bf.readLine();
        System.out.println(consoaneMari(a));
        */

        /*7
        a = bf.readLine();
        b = bf.readLine();
        System.out.println(isAnagram(a,b));
        */

        /*8
        fr = new FileReader("in.txt");
        while((e = fr.read()) != -1)
        a += (char)e;
        System.out.print(a);
        */

        /*9
        fr = new FileReader("in.txt");
        int s = 0;
        while((e = fr.read()) != -1)
            a += (char)e;
        a = a.replace("\r","");
        a = a.replace("\n"," ");
        g = a.split(" ");
        int n = Integer.parseInt(g[0]);
        for(int i = 1;i < n;++i)
        {
            s+=Integer.parseInt(g[i]);
        }
        System.out.println("Suma este: " + s);
        */

        /*10
        char lit = ' ';
        String cuvantMaxim = "";
        int maxLitera = 0;
        int maxLungime = 0;
        int[] litere = new int[30];
        fr = new FileReader("cuvinte.txt");
        int s = 0;

        while((e = fr.read()) != -1)
            a += (char)e;
        a = a.toLowerCase();
        a = a.replace("\n"," ").replace("\r","");
        g = a.split(" ");
        for(int i = 0;i < g.length;++i)
        {
            for(int j = 0;j < g[i].length();++j)
            {
                litere[(int)(g[i].charAt(j) - 'a')]++;
            }
            if(maxLungime < g[i].length())
            {
                cuvantMaxim = "";
                maxLungime = g[i].length();
                cuvantMaxim += g[i];
            }
        }
        for(int i = 0;i < 30;++i)
        {
            if(litere[i] > maxLitera)
            {
                lit = (char)(i + 'a');
                maxLitera = litere[i];
            }
        }
        System.out.println("Cel mai lung cuvant: " + cuvantMaxim + " cea mai utilizata litera: " + lit);
        */

        /*11
        BufferedWriter bw = new BufferedWriter(new FileWriter("out.txt"));
        fr = new FileReader("cuvinte.txt");
        int s = 0;
        while((e = fr.read()) != -1)
            a += (char)e;
        for(int i = 0;i < a.length();++i)
        {
            if(a.charAt(i) >= 'a' && a.charAt(i) <= 'z')
            {
                b+=(char)(a.charAt(i) - 'a' + 'A');
            }
            else if(a.charAt(i) >= 'A' && a.charAt(i) <= 'Z')
            {
                b+=(char)(a.charAt(i) - 'A' + 'a');
            }
            else
                b+=(char)a.charAt(i);
        }
        bw.write(b);
        bw.close();
        */

        /*12
        int max = 0;
        char[] caractere = {'a','e','i','o','u'};
        char maxChar = ' ';
        int[] v = new int[5];
        fr = new FileReader("cuvinte.txt");
        int s = 0;
        while((e = fr.read()) != -1)
            a += (char)e;
        a = a.toLowerCase();
        for(int i = 0;i < a.length();++i)
        {
            if(a.charAt(i) == 'a')
            {
                v[0]++;
            }
            else if(a.charAt(i) == 'e')
            {
                v[1]++;
            }
            else if(a.charAt(i) == 'i')
            {
                v[2]++;
            }
            else if(a.charAt(i) == 'o')
            {
                v[3]++;
            }
            else if(a.charAt(i) == 'u')
            {
                v[4]++;
            }
        }
        for(int i = 0;i < 5;++i)
        {
            if(v[i] > max)
            {
                max = v[i];
                maxChar = caractere[i];
            }
        }
        System.out.println(maxChar);
        */
    }

    public static int nrAparitii(String a,String b)
    {
        int nr = 0;
        boolean x;
        int id = a.indexOf(b.charAt(0));
        while(id != -1)
        {
            a = a.substring(id,a.length());
            x = a.startsWith(b);
            if(x)
                nr++;
            a = a.substring(1,a.length());
            id = a.indexOf(b.charAt(0));
        }
        return nr;
    }

    public static String Repunere(String a,char c)
    {
        String b = a.replace(c,'*');
        return b;
    }

    public static String[] splitJMK(String a)
    {
        int id = a.indexOf(" "),j = 1;
        String[] b = new String[10];
        if(id != -1)
        {
            b[0] = a.substring(0,id);
        }
        while(id != -1)
        {
            a = a.substring(id+1,a.length());
            id = a.indexOf(" ");
            if(id == -1)
                break;
            b[j] = a.substring(0,id);
            ++j;
        }
        if(a.length() != 0)
            b[j] = a;
        //System.out.println(b[0] + ' ' + b[1] + ' ' + b[2]);
        return  b;
    }

    public static String literaMareCuvant(String a)
    {
        String b = "";
        int i = 0;
        if(a.charAt(0) != ' ')
        {
            b += a.substring(0,1).toUpperCase();
            i = 1;
        }
        for(;i < a.length();++i)
        {
            if((a.charAt(i) == ' ') && (i != a.length() - 1))
            {
                b += ' ';
                b += a.substring(i+1,i+2).toUpperCase();
                ++i;
            }
            else
            {
                b+=a.charAt(i);
            }
        }
        return b;
    }

    public static int nrVocale(String a)
    {
        int nr = 0;
        a = a.toLowerCase();
        for(int i = 0;i < a.length();++i)
        {
            if(a.charAt(i) == 'a' || a.charAt(i) == 'e' || a.charAt(i) == 'i' || a.charAt(i) == 'o' || a.charAt(i) == 'u')
                nr++;
        }
        return nr;
    }

    public static String consoaneMari(String a)
    {
        String b = "";
        for(int i = 0;i < a.length();++i)
        {
            if(a.charAt(i) != 'a' && a.charAt(i) != 'e' && a.charAt(i) != 'i' && a.charAt(i) != 'o' && a.charAt(i) != 'u')
            {
                b += a.substring(i,i+1).toUpperCase();
            }
            else
            {
                b+=a.charAt(i);
            }
        }
        return b;
    }

    public static boolean isAnagram(String a,String b)
    {
        char[] c = new char[30];
        char[] d = new char[30];
        a = a.toLowerCase();
        b = b.toLowerCase();
        for(int i = 0;i < a.length();++i)
        {
            if(Character.isLetter(a.charAt(i)))
            {
                c[a.charAt(i) - 'a'] = 1;
            }
        }
        for(int i = 0;i < b.length();++i)
        {
            if(Character.isLetter(b.charAt(i)))
            {
                d[b.charAt(i) - 'a'] = 1;
            }
        }
        for(int i = 0;i < 30;++i)
        {
            if(c[i] != d[i])
            {
                return false;
            }
        }
        return true;
    }
}

