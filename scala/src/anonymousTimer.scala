
object TimerAnonymous {
	def oncePerSecond(callback: () => Unit) {
		// Nimm eine Funktion als Argument
		while (true) {
			callback() // Rufe die Funktion hier auf
			Thread sleep 1000
		}
	}
	def main(args: Array[String]) {
		// Uebergebe oncePerSecond eine anonynome Funktion
		oncePerSecond(() => 
			println("time flies like an arrow...")
		)
	}
}
