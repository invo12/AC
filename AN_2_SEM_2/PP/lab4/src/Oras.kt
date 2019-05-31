class Oras(nume:String,nrLoc:Int,private var nrBlocuri:Int,private var nrSpitale : Int) : Asezare(nume,nrLoc){
    fun getNrSpitale() = nrSpitale
    fun getNrBlocuri() = nrBlocuri
    fun setNrSpitale(s : Int)
    {
        nrSpitale = s
    }
    fun setNrBlocuri(s:Int)
    {
        nrBlocuri = s
    }
}