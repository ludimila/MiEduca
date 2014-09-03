package mieduca
import java.text.SimpleDateFormat  


class Course {


	String name
	String description
	byte[] coursePhoto
	int points

	//def sdf = new SimpleDateFormat("MM/dd/yyyy")  
	//Date nowDate = new Date()
	Date publishDate = new Date()

	Date lastEditDate  = new Date()
 	//Date.parse("MMM dd yyyy", publishDate)
	// static hasMany : [lessons:Lesson]
	static belongsTo = [Area, Rank]


    static constraints = {

    	name size: 5..100, blank: false
    	description size: 15..5000, blank:false
    	publishDate editable: false , display: true, format: 'dd/MM/yyyy'
    	lastEditDate editable: false, display: true, format: 'dd/MM/yyyy' 
    	points editable: false, display : false

    	coursePhoto maxSize : 1024 * 1024 * 2

    }

}
