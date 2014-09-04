package mieduca

class Question {

	String statement
	AnswerOption correctAnswer

	static hasMany = [options:AnswerOption]
	static belongsTo = Lesson



    static constraints = {
    }
}
