package agents;
import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.core.behaviours.OneShotBehaviour;
import jade.lang.acl.ACLMessage;
import jade.core.AID;

public class Victim extends Agent {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void setup(){
		
		addBehaviour(new OneShotBehaviour(this){
			
			/**
			 * 
			 */
			private static final long serialVersionUID = 1L;

			public void action(){
				
				ACLMessage message = new ACLMessage(ACLMessage.INFORM);
				message.addReceiver(new AID("Bombeiro",AID.ISLOCALNAME));
				message.setLanguage("Português");
				message.setOntology("Emergência");
				message.setContent("Fogo");
				myAgent.send(message);
				
			}
				
			
		});
		
		addBehaviour(new CyclicBehaviour(this) {
			
			@Override
			public void action() {
				ACLMessage message = myAgent.receive();
				if(message != null){
					String content = message.getContent();
					
					System.out.println("-->" + message.getSender().getName() + ":" + content);
				}else{
					block();
				}
				
			}
		});
		
	}
}
