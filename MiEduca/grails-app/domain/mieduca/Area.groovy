package mieduca

class Area {

	String name

	static hasMany = [courses:Course]

    static constraints = {

    	courses nullable:false, blank:false
    	name nullable:false, blank:false, size:2..50

    }
}
