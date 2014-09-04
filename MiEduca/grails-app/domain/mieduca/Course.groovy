package mieduca


class Course {


	String name
	String description
	byte[] coursePhoto
	int points = 0
	Date publishDate = new Date()

	Date lastEditDate  = new Date()

	static hasMany = [lessons:Lesson]
	static belongsTo = [Area, Rank]


    static constraints = {

    	name size: 5..100, blank: false
    	description size: 15..5000, blank:false
    	coursePhoto maxSize : 1024 * 1024 * 2
    	lessons nullable:false
    	publishDate editable: false , display: true, format: 'dd/MM/yyyy'
    	lastEditDate editable: false, display: true, format: 'dd/MM/yyyy'
    	points editable: false, display : false


    }

}
