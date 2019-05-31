open class Judet(private val nume:String):Grupare {
    val comune : MutableList<Comuna> = mutableListOf()
    val orase : MutableList<Oras> = mutableListOf()
    fun AddComuna(s:Comuna)
    {
        comune.add(s)
    }
    fun AddOras(s:Oras)
    {
        orase.add(s)
    }
    open fun getName() = nume
}