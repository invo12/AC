open class Asezare(private var nume:String,private var nrLoc : Int) {
    fun setName(nume:String)
    {
        this.nume = nume
    }
    fun getName():String = nume
    fun setLoc()
    {
        this.nrLoc = nrLoc
    }
    fun getLoc() = nrLoc
    fun isCapitala() = false;
}