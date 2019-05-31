fun main(args : Array<String>){
    val sate_iasi = arrayOf<Sat>(Sat("Badeni", 1700, 321), Sat("Cucuteni", 3200, 1419), Sat("Poieni", 4210, 1771))
    val sate_neamt = arrayOf<Sat>(Sat("Cut",5200,1807), Sat("Brasauti",2900,660), Sat("Valeni",2450,1000), Sat("Izvoare",5200,1205))
    val comune_iasi = arrayOf<Comuna>(Comuna("Osoi"), Comuna("Mironeasa"))
    val comune_neamt = arrayOf(Comuna("Dumbrava Rosie"))
    val orase_iasi = arrayOf<Oras>(Oras("Pascani", 34200, 210, 2), Oras("Iasi", 800000, 3400, 7))
    val orase_neamt = arrayOf<Oras>(Oras("Piatra Neamt", 300000, 1780, 1), Oras("Roman", 150000, 630, 1))
    val judete = arrayOf<Judet>(Judet("Iasi"), Judet("Neamt"), Judet("Bucuresti"))
    val capitala = Capitala("Bucuresti Resedinta", 1459)
    comune_iasi[0].AddSat(sate_iasi[0])
    comune_iasi[0].AddSat(sate_iasi[1])
    comune_iasi[1].AddSat(sate_iasi[2])
    sate_neamt.forEach{
        comune_neamt[0].AddSat(it) }
    comune_iasi.forEach {
    judete[0].AddComuna(it)
}
    orase_iasi.forEach {
    judete[0].AddOras(it)
}
    comune_neamt.forEach {
    judete[1].AddComuna(it)
}
    orase_neamt.forEach {
    judete[1].AddOras(it)
}
    val sate_bucuresti = arrayOf<Sat>(Sat("Piteasca", 4700, 450), Sat("Tamasi", 2300, 650))
    val comune_bucuresti = arrayOf<Comuna>(Comuna("Cornetu" ), Comuna("Jilava"))
    val orase_bucuresti = arrayOf<Oras>(Oras("Bucuresti", 2500000, 8901, 15), Oras("Ilfov", 460000, 3400, 5))
    comune_bucuresti[0].AddSat(sate_bucuresti[0])
    comune_bucuresti[1].AddSat(sate_bucuresti[1])
    comune_bucuresti.forEach {
        judete[2].AddComuna(it)
    }
    orase_bucuresti.forEach {
        judete[2].AddOras(it)
    }
    val tara = Tara("Romania", capitala, judete.toSet())
    println("\n\n-----------------------------------------------------------------")
    val toate_satele = sate_bucuresti + sate_iasi + sate_neamt
    val toate_comunele = comune_bucuresti + comune_iasi + comune_neamt
    val toate_orasele = orase_bucuresti + orase_iasi + orase_neamt
    toate_satele.forEach {
        println("${it.getName()} este capitala : ${it.isCapitala()}")
    }
    toate_comunele.forEach {
        println("${it.getName()} este capitala : ${it.isCapitala()}")
    }
    toate_orasele.forEach {
        println("${it.getName()} este capitala : ${it.isCapitala()}")
    }
    judete.forEach {
        println("${it.getName()} este capitala : ${it.isCapitala()}")
    }
    println("${capitala.getName()} este capitala : ${capitala.isCapitala()}")
}