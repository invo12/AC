import java.io.File

fun main(args:Array<String>)
{
    val file = File("text.txt")
    val text = File("text.txt").readText().replace("  +[0-9]+  +".toRegex(),"").replace("  +".toRegex()," ").replace("\r\n[\r\n]+".toRegex(),"\n")
    println(text)

    file.delete()
    file.writeText(text)

}