package mieduca

class Lesson {

	String name
	Course course
	String description

	static belongsTo = Course

	static hasMany = [questions:Question, contents: Content]

    static constraints = {

    	name size: 5..100, blank: false
    	description size: 15..5000, blank:false
    	questions nullable: true

    }
}
