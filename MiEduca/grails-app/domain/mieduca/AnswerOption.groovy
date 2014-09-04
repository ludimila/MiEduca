package mieduca

class AnswerOption {

	int number
	String text

	static belongsTo = Question

    static constraints = {

    	number nullable:false, blank:false
    	text nullable:false, blank:false, minSize:2
    }

    String toString(){
    	number
    }
}
