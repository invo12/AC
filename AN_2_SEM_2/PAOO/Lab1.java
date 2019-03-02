import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException
    {
        int a,b,c,h1,h2,m1,m2,s1,s2;
        double e,f,g;
        double arie;
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String line;
        int n = (int)(Math.random() * 1000);
        Spanzuratoare(n);
        System.out.println("Numarul era: " + n);
/*        line = br.readLine();
        a = Integer.parseUnsignedInt(line);
        line = br.readLine();
        b = Integer.parseUnsignedInt(line);
        line = br.readLine();
        c = Integer.parseUnsignedInt(line);
*/
//        System.out.println(Arie(a,b,c));
//        TipTriunghi(a,b,c);
/*        line = br.readLine();
        e = Double.parseDouble(line);
        line = br.readLine();
        f = Double.parseDouble(line);
        line = br.readLine();
        g = Double.parseDouble(line);
*/
//        RezolvareEcuatieGrad2(e,f,g);
//        Cadran(e,f);
/*        line = br.readLine();
        h1 = Integer.parseUnsignedInt(line);
        line = br.readLine();
        m1 = Integer.parseUnsignedInt(line);
        line = br.readLine();
        s1 = Integer.parseUnsignedInt(line);
        line = br.readLine();
        h2 = Integer.parseUnsignedInt(line);
        line = br.readLine();
        m2 = Integer.parseUnsignedInt(line);
        line = br.readLine();
        s2 = Integer.parseUnsignedInt(line);
        Durata(h1,m1,s1,h2,m2,s2);
        **/
    }
//p1
    public static double Arie(int a,int b,int c)
    {
        double p = (a + b + c)/2.0f;
        double arie = Math.sqrt(p * (p-a) * (p - b) * (p-c));
        return arie;
    }
//p2
    public static void TipTriunghi(int a,int b,int c)
    {
        if((a + b > c) && (a + c > b) && (c + b > a))
        {
            if((a == b) && (b==c))
            {
                System.out.println("E TRIUNGHI ECHILATERAL");
            }
            else if((a * a + b * b == c * c) || (b * b + c * c == a * a) || (a * a + c * c == b * b) )
            {
                if((a == b) || (b == c) || (c == a))
                {
                    System.out.println("E TRIUNGHI DREPTUNGHIC ISOSCEL");
                }
                else
                {
                    System.out.println("E TRIUNGHI DREPTUNGHIC");
                }
            }
            else if((a == b) || (b == c) || (c == a))
            {
                System.out.println("E TRIUNGHI ISOSCEL");
            }
            else
            {
                System.out.println("E TRIUNGHI OARECARE");
            }
        }
        else
        {
            System.out.println("NU E TRIUNGHI");
        }
    }
//p3
    public static  void RezolvareEcuatieGrad2(double a,double b,double c)
    {
        if(a == 0)
        {
            if(b == 0)
            {
                if(c == 0)
                {
                    System.out.println("Infinitate de solutii");
                }
                else
                {
                    System.out.println("Nu sunt solutii");
                }
            }
            else
            {
                System.out.println("Ecuatia are o solutie reala: " + (-c/b));
            }
        }
        else
        {
            double delta = b*b - 4 * a * c;
            if(delta > 0)
            {
                System.out.println("Ecuatia are doua solutii reale distincte: " + (-b + Math.sqrt(delta))/(2 * a) + " si " + (-b + Math.sqrt(delta))/(2 * a));
            }
            else if (delta == 0)
            {
                System.out.println("Ecuatia are doua solutii reale egale: " + (-b + Math.sqrt(delta))/(2 * a));
            }
            else
            {
                System.out.println("Ecuatia are doua solutii complexe diferite: " + (-b/(2*a)) + "+" + (Math.sqrt(-delta) / (2 * a)) + "i" + " si " + (-b/(2*a)) + "+" + (-Math.sqrt(-delta) / (2 * a)) + "i");
            }
        }
    }
//p4
    public static void Cadran(double x,double y)
    {
        if(x == 0 && y == 0)
        {
            System.out.println("1,2,3,4");
        }
        else if(x == 0)
        {
            if(y > 0)
                System.out.println("1,2");
            else
                System.out.println("3,4");
        }
        else if(y == 0)
        {
            if(x > 0)
                System.out.println("1,4");
            else
                System.out.println("2,3");
        }
        else
        {
            if(x > 0 && y > 0)
                System.out.println("1");
            else if(x < 0 && y > 0)
                System.out.println("2");
            else if(x < 0 && y < 0)
                System.out.println("3");
            else
                System.out.println("4");
        }
    }

    public static void Durata(int h1,int m1,int s1,int h2,int m2,int s2)
    {
        int h,m,s;
        if(h2 <  h1)
        {
            h = h2 - h1 + 24;
        }
        else
        {
            h = h2 - h1;
        }
        if(m2 <  m1)
        {
            m = m2 - m1 + 60;
            h = h - 1;
        }
        else
        {
            m = m2 - m1;
        }
        if(s2 <  s1)
        {
            s = s2 - s1 + 60;
            m = m - 1;
        }
        else
        {
            s = s2 - s1;
        }
        System.out.println("Conexiunea a durat: " + h + " ore " + m + " minute " + s + " secunde");
    }

    public static void Spanzuratoare(int n) throws IOException
    {
        int[] digits = new int[10];
        int count = 0,i,vieti = 3;
        System.out.println("Aveti " + vieti + " vieti");
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String line;
        while(n != 0)
        {
            if(digits[n%10] == 0)
            {
                digits[n%10] = 1;
                count++;
            }
            n/=10;
        }
        while(count != 0 && vieti != 0)
        {
            System.out.println("Dati o cifra");
            line = br.readLine();
            i = Integer.parseUnsignedInt(line);
            if(i > 9)
                continue;
            if(digits[i] == 1) {
                digits[i] = 0;
                count--;
            }
            else
            {
                vieti--;
                if(vieti > 1)
                    System.out.println("Mai aveti " + vieti + " vieti");
                else if(vieti == 1)
                    System.out.println("Mai aveti o viata");
            }
        }
        if(vieti == 0)
        {
            System.out.println("ai pierdut");
        }
    }
}
