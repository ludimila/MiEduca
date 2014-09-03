package mieduca

class Content {

	//Lesson lesson
	byte [] data
	int type


    static constraints = {

    	type unique:true, editable: false
    	data maxSize: 1024*1024*10
	}
}