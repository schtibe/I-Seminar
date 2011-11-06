abstract class Shape(
		var id:   String,
		var xPos: Int,
		var yPos: Int) {

	if (xPos < 0 || yPos < 0) {
		throw new IllegalArgumentException("Position variables must be positive")
	}

	def move(x: Int, y: Int) {
		this.xPos += x
		this.yPos += y
	}

	override def toString() = "[" + this.getLabel + "] id: " + this.id + 
		" position: " + this.xPos + "/" + this.yPos + " " + this.getShapeInfo

	def draw() {
		println("Hold on buddy, doing some drawin'")
	}

	protected def getLabel()
	protected def getShapeInfo()
}

class Ellipse(
		    id:      String,
		    x:       Int,
		    y:       Int,
		var radius:  Int,
		var stretch: Int) extends Shape(id, x, y) {
	
	def getLabel() = "Ellipse"
	def getShapeInfo() = "radius: " + this.radius +
		" stretch factor: " + this.stretch
}

class Circle(
		id:     String,
		x:      Int,
		y:      Int,
		radius: Int) extends Ellipse(id, x, y, radius, 0) {

	override def getLabel() = "Circle"
	override def getShapeInfo() = "radius: " + this.radius
}

class Rectangle(
	    id: String,
	    x:  Int,
	    y:  Int,
	var w:  Int,
	var h:  Int ) extends Shape(id, x, y) {

	def getLabel() = "Rectangle"
	def getShapeInfo() = "width: " + this.w + "this.height" + this.h
}

class Square(
	    id: String,
	    x:  Int,
	    y:  Int,
		s:  Int ) extends Rectangle(id, x, y, s, s) {
		
	override def getLabel() = "Square"
	override def getShapeInfo() = "sidelength: " + this.s
}
