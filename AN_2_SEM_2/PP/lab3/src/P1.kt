class Birth(val day : Int,val month : Int,val year:Int)
{
    override fun toString(): String {
        return "($day/$month/$year)"
    }
}

class Contact(val nume : String,val numar:String,val birth:Birth)
{
    fun Print()
    {
        println("Nume: $nume,Numar: $numar,Date: $birth")
    }
}

fun cautare(contacte: MutableList<Contact>,c:String):Contact?
{
    for(i in contacte)
        if(i.nume == c)
            return i
    return null
}

fun main(args:Array<String>)
{
    val contacte : MutableList<Contact> = mutableListOf()
    contacte.add(Contact("Andrei","0753021343",Birth(2,2,2012)))
    contacte.add(Contact("Alex","0776842012",Birth(3,4,1998)))
    contacte.add(Contact("Mihai","0753021613",Birth(15,6,2015)))
    contacte.add(Contact("Andra","0753025623",Birth(26,12,2013)))

    for (i in contacte)
        i.Print()
    print(cautare(contacte,"Andre")?.numar)
}