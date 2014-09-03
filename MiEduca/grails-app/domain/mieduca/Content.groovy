package mieduca

class Content {

	//Lesson lesson
	Byte [] data
	Integer type


    static constraints = {

    	type unique:true, editable: false
    	data unique:false
   }
}