package mieduca

class Person extends User{
	
	String email
	int points = 0
	String webPage

	static belongsTo = Rank

    static constraints = {
    	email email:true, blank:false, unique:true
    	points editable: false, display: false
    }

}
