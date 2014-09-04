package mieduca

class Content {

	//Lesson lesson
	byte [] data
	String type


    static constraints = {

    	type unique:true , inList:["Imagem","Vídeo","PDF","Texto"], nullable:false , blank:false
    	data maxSize: 1024*1024*10, minSize: 1, nullable: false , blank:false
	}
}