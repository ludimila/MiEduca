package mieduca

class Person {
	
	String email
	int points = 0
	String webPage
	User user

	static belongsTo = Rank

    static constraints = {
    	email email:true, blank:false, unique:true
    	points editable: false, display: false
    }

}
