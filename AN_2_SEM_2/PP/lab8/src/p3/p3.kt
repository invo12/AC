package p3

fun main(args:Array<String>)
{
    val c =Calatorie("Conferința RSA din San Francisco - SUA")
    val a = Activitate("Activități din prima zi")
    val c1 =Calatorie("Vizită în San Francisco")
    val c2 = Calatorie("Vizită la închisoarea Alcatraz")
    val a1 = Activitate("Activități din ziua prezentării")
    val d = Discurs("Prezentarea lucrării")
    val i = Idee("Evitare emoții 1")
    val i1 = Idee("Corelare informații")
    val i2 = Idee("Prezentator care a atras atenția")
    val p = Prietenie("Doctor Strange -> autorul lucrării 'Ghost in the shell' Activități din ultima zi")
    val a2 = Activitate("Activitati din ultima zi")
    val p1 = Prietenie("Eugene Kaspersky -> unul din participanții la conferinta")
    val p2 = Prietenie("Fabian Wosar -> Leaderul echipei de ransomware decrypto-tools, de la Emsisoft")
    val i3 = Idee("Tur nocturn în cartierul chinezesc")
    val cadou = Cadou(" Magnet pentru frigider, cu podul Golden Gate")
    val cadou2 = Cadou("Vederi")
    c.addChild(a)
    c.addChild(a1)
    c.addChild(a2)

    a.addChild(c1)
    a.addChild(c2)

    a1.addChild(d)
    a1.addChild(i2)
    a1.addChild(p)

    d.addChild(i)
    d.addChild(i1)

    a2.addChild(p1)
    a2.addChild(p2)
    a2.addChild(i3)

    i3.addChild(cadou)
    i3.addChild(cadou)

    c.show(0)
}
