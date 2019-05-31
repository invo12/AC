class Comuna(val nume:String):Grupare {
    val sate:MutableList<Sat> = mutableListOf()
    fun AddSat(s:Sat)
    {
        sate.add(s)
    }
    fun getName() = nume

}