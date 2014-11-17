import jade.core.Agent;
import jade.core.behaviours.OneShotBehaviour;
import jade.lang.acl.ACLMessage;
import jade.core.AID;

public class Vitima extends Agent {

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
		
		
	}
}
