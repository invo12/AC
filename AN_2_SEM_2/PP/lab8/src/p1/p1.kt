package p1

//decomentezi asta dar tre sa comentezi p2.kt
//decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt
////decomentezi asta dar tre sa comentezi p2.kt


//import java.io.File
//import java.util.*
//
//class Burger(val name:String)
//class Angajat(val name : String) : Observable
//{
//    fun serveste(name:String)
//    {
//        var burger = Burger(name)
//        setChanged()
//        notifyObservers(burger)
//    }
//}
//class Client(val name:String):Observer
//{
//    override fun update(o: Observable?, arg: Any?) {
//        when(o)
//        {
//            is Angajat ->
//            {
//                if(arg is Burger)
//                {
//                    File("out.txt").appendText("$name a fost servit de ${o.name} cu ${arg.name}\n")
//                }
//            }
//            else ->
//            {
//                println("JAAAF")
//            }
//        }
//    }
//}
//
//fun serveste(a:Angajat,c:Client,p:String)
//{
//    a.addObserver(c)
//    a.serveste(p)
//    a.deleteObserver(c)
//}
//
//fun main(args:Array<String>)
//{
//    File("out.txt").delete()
//    val angajati:MutableList<Angajat> = mutableListOf(Angajat("Alex"),Angajat("Andrei"),Angajat("Ionut"))
//    val clienti:MutableList<Client> = mutableListOf(Client("Mihai"),Client("Radu"),Client("Calin"),Client("Vasile"))
//    var nrCoada : Int = 0
//    var produs : String
//    for(i in clienti)
//    {
//        nrCoada = readLine()!!.toInt()
//        produs = readLine()!!
//        serveste(angajati[nrCoada % angajati.size],i,produs)
//    }
//}