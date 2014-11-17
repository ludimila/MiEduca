import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;

public class Firefight extends Agent{

	protected void setup (){
		
		addBehaviour(new CyclicBehaviour (this){
			
			public void action (){
				ACLMessage message = myAgent.receive();
				if (message != null){
				
					String content = message.getContent();
					
					if(content.equalsIgnoreCase("Fogo")){
						
						System.out.println("O cidadão " + message.getSender().getName()+"avisou um incendio");
						System.out.println("Vou ativar os procedimentos de combate a incendio");			
						
					}else
						block();
				}//fim do action
				
			}
		});//fim do behaviour
	
		
	}
	
	
}
