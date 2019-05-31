class Capitala(val nume:String,an:Int):Judet(nume.replace(" Resedinta","")),Grupare {
    override fun isCapitala() = true
    override fun getName() = nume
}