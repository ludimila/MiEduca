package mieduca

class Question {

	String statement
	String answer

	def options = new ArrayList(4)

	static belongsTo = Lesson



    static constraints = {
    }
}
