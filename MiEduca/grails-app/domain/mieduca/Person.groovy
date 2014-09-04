package mieduca

class Person extends User{
	
	String email
	int points = 0
	String webPage
	byte[] photo

	static belongsTo = Rank

    static constraints = {
    	email email:true, blank:false, unique:true
    	points editable: false, display: false
    	photo maxSize: 1024 * 1024 * 10
    	webPage url:true
    }

    String toString(){
    	username
    }
}
