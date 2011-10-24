
class Constructing(user: String) {
	def name = user
	println("Greetings from the constructor to " + this.name)

	def calculate: String = return "2 + 3 is " + (2 + 3)
}
