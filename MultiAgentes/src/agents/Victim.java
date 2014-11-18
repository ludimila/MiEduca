package agents;
import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.core.behaviours.OneShotBehaviour;
import jade.lang.acl.ACLMessage;
import jade.util.leap.Iterator;
import jade.core.AID;
import jade.domain.DFService;
import jade.domain.FIPAException;
import jade.domain.FIPAAgentManagement.DFAgentDescription;
import jade.domain.FIPAAgentManagement.ServiceDescription;

public class Victim extends Agent {

	private static final long serialVersionUID = 1L;

	protected void setup(){
		
		searchFirefight();
		sendMessage();
		receiveMessage();
		
	}

	private void sendMessage() {
		addBehaviour(new OneShotBehaviour(this){
			
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

	private void receiveMessage() {
		addBehaviour(new CyclicBehaviour(this) {
			
			private static final long serialVersionUID = 1L;

			@Override
			public void action() {
				ACLMessage message = myAgent.receive();
				if(message != null){
					String content = message.getContent();
					System.out.println("-->" + message.getSender().getName() + " : " + content);
				}else{
					block();
				}
			}
		});
	}

	protected void searchFirefight() {
		DFAgentDescription searchServices = new DFAgentDescription();
		
		ServiceDescription service = new ServiceDescription();
		service.setType("Firefight");
		
		searchServices.addServices(service);
		
		try {
			
			DFAgentDescription[] firefight = DFService.search(this, searchServices);
			printServices(firefight);
			
		}catch(FIPAException e){
			e.printStackTrace();
		}
	}

	private void printServices(DFAgentDescription[] firefight) {
		
		for(int i = 0; i < firefight.length; i++){
			
			String out = firefight[i].getName().getLocalName() + "  provê: ";
			Iterator services = firefight[i].getAllServices();
			
			while(services.hasNext()){
				ServiceDescription serviceDescription = (ServiceDescription) services.next();
				out += " " + serviceDescription.getName();
			}
			
			System.out.println(out);
		}
	}
}
