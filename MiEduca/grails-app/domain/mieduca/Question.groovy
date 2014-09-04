package mieduca

class Question {

	String statement
	AnswerOption correctAnswer

	static hasMany = [options:AnswerOption]
	static belongsTo = Lesson



    static constraints = {
    	statement blank:false, minSize: 5
    	options blank:false , nullable: false
    	correctAnswer blank:false, nullable:false

    }
}
