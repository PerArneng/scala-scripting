#!/usr/bin/env scalas
  
/***         
scalaVersion := "2.10.6"
libraryDependencies += "com.github.scopt" %% "scopt" % "3.4.0"
resolvers += Resolver.sonatypeRepo("public")
*/

case class Config(foo:Int=1)

object HelloWorld {
  
  def main(args: Array[String]) {

   val parser = new scopt.OptionParser[Config]("Test.scala.bat") {
      head("Test.scala.bat", "1.0")
      opt[Int]('f', "foo") required() action { (x, c) => c.copy(foo = x) } text("foo is an integer property")
      help("help") text("prints this usage text")
      
      override def showUsageOnError = true

    }

    parser.parse(args, Config()) match {
      case Some(config) =>
        println(s"foo is=${config.foo}")
      case None =>
        // arguments are bad, error message will have been displayed
    }
    
  }
  
}

HelloWorld.main(args)
