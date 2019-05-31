class Sat(nume:String,nrLoc:Int,private var nrCase:Int) : Asezare(nume,nrLoc) {
    fun getNrCase() = nrCase
    fun setNrCase(s:Int)
    {
        nrCase = s
    }

}