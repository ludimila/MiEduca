package mieduca

class Person extends User{
	
	String email
	int points = 0
	def webPage
	byte[] photo

	static belongsTo = Rank

    static constraints = {
    	email email:true, blank:false, unique:true
    	points editable: false, display: false
    	photo blank:true, maxSize: 1024 * 1024 * 10, display:false
    	webPage blank:true, display:false
    }

    String toString(){
    	username
    }
}
