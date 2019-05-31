import java.io.File

fun HashMap<String,String>.add(key:String, value:String)
{
    if(!this.contains(key))
        this[key] = value
}

fun main(args : Array<String>){
    val Dictionar = hashMapOf<String, String>()
    val input = File("dict.txt").readText()
    val cuvinte =  input.replace('\r',' ').split(" ")
    print(cuvinte)
    var i:Int = 0
    while(i < cuvinte.size-1)
    {
        Dictionar.add(cuvinte[i].trim(' ','\n'),cuvinte[i+1].trim(' ','\n'))
        i+=2
    }

    Dictionar.add("yes","da")
    val Poveste = "yes, Once upon a time there was an old woman who loved baking gingerbread. She would bake gingerbread cookies, cakes, houses and gingerbread people, all decorated with chocolate and peppermint, caramel candies and colored ingredients."

    val words1 = Poveste.split(" ")

    println("Cuvintele din poveste [${words1.count()}]:")
    //for (word in words1)
      //  print(word + " ")

    val words2 = mutableListOf<String>()
    for (word in words1){
        words2.add(word.trim(',','.'))
    }
    File("da.txt").delete()
    for (item in words2){
        if (Dictionar.contains(item))
            File("da.txt").appendText(Dictionar[item]!! + " ")
        else
            File("da.txt").appendText("[$item]")
    }

}