package p3

class Calatorie(val nume:String) :Eveniment {
    val fii = mutableListOf<Eveniment>()
    override fun show(level: Int) {
        for(i in 0..level)
            print('\t')
        println(nume)
        for(i in 0..fii.size-1)
        {
            fii[i].show(level+1)
        }
    }

    override fun addChild(eveniment: Eveniment) {
        fii.add(eveniment)
    }

    override fun removeChild(eveniment: Eveniment) {
        fii.remove(eveniment)
    }
}