class foo(var x:Int, y:Int) extends bar(y)  {
	if (y > 0) {
		throw new Exception("Invalid Argument");
	}
	
	var member:String = "Ich bin drin!"

	override def toString(): String = 
		"foo says hello"

	private def doSomething() {
		println("something stupid?")
	}
}
