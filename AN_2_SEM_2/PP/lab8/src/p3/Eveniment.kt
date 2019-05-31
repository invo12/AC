package p3

interface Eveniment {
    fun show(level:Int)
    fun addChild(eveniment:Eveniment)
    fun removeChild(eveniment: Eveniment)
}