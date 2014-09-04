package mieduca

class Lesson {

	String name
	String description

	static belongsTo = Course
	static hasMany = [questions:Question, contents: Content]

    static constraints = {

    	name size: 5..100, blank: false
    	description minSize: 15, blank:false
    	contents nullable:false, blank: false
    	questions nullable: false, blank: false
    }

    String toString(){
        name
    }
}
