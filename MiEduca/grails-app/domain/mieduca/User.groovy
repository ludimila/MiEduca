package mieduca

class User {

	String userName
	String email
	String password
	String points
	String webPage

	static belongsTo = Rank

    static constraints = {
    	userName blank:false
    	email email:true
    	password password:true
    	points inList:["","0","1","2","3","4","5"]
    }
}
