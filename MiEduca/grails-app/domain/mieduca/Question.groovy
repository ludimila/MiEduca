package mieduca

class Question {

	String statement
	Integer answer
	Lesson lesson

	def options = new ArrayList(4)

	static belongsTo = [Lesson]


    static constraints = {
    }
}
