import java.io.File
import kotlin.Long as Long1

interface PrimeObserver
{
    fun update(value:Int)
}

class ConsoleObserver:PrimeObserver
{
    override fun update(value: Int) {
        println("Next value:$value")
    }
}
class TextObserver:PrimeObserver
{
    override fun update(value: Int) {
        File("out2.txt").appendText("Next value:$value\n")
    }
}
class HTMLObserver : PrimeObserver{
    override fun update(value: Int) {
        val f = File("Prime.html").writer()
        f.write("<html> <head> <title>PP Lab-8 P1</title> <meta http-equiv=\"refresh\" content=\"2\"> </head> <body> <p> NextValue: $value </p> </body> </html>")
        f.close()
    }
}

interface Observable
{
    fun addObserver(a:PrimeObserver)
    fun deleteObserver(a:PrimeObserver)
    fun notifyObservers(a:Int)
}

class PrimeObservable : Observable {
    val observers = mutableListOf<PrimeObserver>()

    fun prim(n: Int): Boolean {
        for (i in 2..n / 2) {
            if (n % i == 0)
                return false
        }
        return true
    }

    override fun addObserver(a: PrimeObserver) {
        observers.add(a)
    }

    override fun deleteObserver(a: PrimeObserver) {
        observers.remove(a)
    }

    override fun notifyObservers(a:Int) {
        observers.forEach{
            it->it.update(a)
        }
    }

    fun run()
    {
        for(i in 2..1000)
        {
            if(prim(i))
            {
                notifyObservers(i)
            }
        }
    }
}

fun main(args:Array<String>)
{
    val console = ConsoleObserver()
    val textfile = TextObserver()
    val htmlfile = HTMLObserver()
    val prime_watcher = PrimeObservable()

    prime_watcher.addObserver(console)
    prime_watcher.addObserver(textfile)
    prime_watcher.addObserver(htmlfile)

    prime_watcher.run()
}