abstract class Expr 
case class Var(name: String) extends Expr
case class Number(num: Double) extends Expr
case class UnOp(operator: String, arg: Expr) extends Expr
case class BinOp(operator: String, left: Expr, right: Expr) extends Expr


object ExpressionSimplifier {
	def simplifyTop(expr: Expr): Expr = expr match {
		case UnOp("-", UnOp("-", e))  => e    // Doppelte Negation
		case BinOp("+", e, Number(0)) => e    // Null addieren
		case BinOp("*", e, Number(1)) => e    // Mit 1 multiplizieren
		case _                        => expr // Lasse den Ausdruck stehen
	}

	def main(args: Array[String]) {
		// --5 => -5
		this.simplifyTop(UnOp("-", UnOp("-", Number(5))))

		// 1 + 0 => 1
		this.simplifyTop(BinOp("+", Number(1), Number(0)))

		// 5 * 1 => 5
		this.simplifyTop(BinOp("*", Number(5), Number(1)))
	}
}
