
class Constructing {
	String name;

	public Constructing(String user) {
		this.name = user;
		System.out.println("Greetings from the Constructor to " + this.name);
	}

	public String calculate() {
		return "2 + 3 is " + 2 + 3;
	}
}
