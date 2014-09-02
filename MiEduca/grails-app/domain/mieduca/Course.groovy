package mieduca

class Course {


	int id
	String name
	String description
	byte[] coursePhoto
	int points
	Date publishDate
	Date lastEditDate

	// static hasMany : [lessons:Lesson]
	static belongsTo = Area
	static belongsTo = Rank


    static constraints = {

    	id unique:true
    	name size: 5..100, blank: false
    	description size: 15..5000, blank:false
    	publishDate max: new Date()
    	coursePhoto maxSize : 1024 * 1024 * 2

    }

}
