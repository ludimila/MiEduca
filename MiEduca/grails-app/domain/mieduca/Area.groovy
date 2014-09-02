package mieduca

class Area {

	int id
	String name

	static hasMany = [courses:Course]

    static constraints = {
    }
}
