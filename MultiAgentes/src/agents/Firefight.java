package agents;
import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.domain.DFService;
import jade.domain.FIPAException;
import jade.domain.FIPAAgentManagement.DFAgentDescription;
import jade.domain.FIPAAgentManagement.ServiceDescription;
import jade.lang.acl.ACLMessage;

public class Firefight extends Agent{
	private static final long serialVersionUID = 1L;

	protected void setup (){

		ServiceDescription service = new ServiceDescription();
		service.setType("Firefight");
		service.setName("Combate a Incêndio");
		
		register(service);
		getMessage();
	
	} 

	protected void getMessage() {
		addBehaviour(new CyclicBehaviour (this){
			private static final long serialVersionUID = 1L;

			public void action (){
				ACLMessage message = myAgent.receive();
				if (message != null){
					ACLMessage  reply = message.createReply();
					String content = message.getContent();
					
					if(content.equalsIgnoreCase("Fogo")){
						reply.setPerformative(ACLMessage.INFORM);
						reply.setContent("Recebi seu Aviso! Obrigada por Auxilia meu serviço");
						myAgent.send(reply);
						System.out.println("O cidadão " + message.getSender().getName()+"  avisou um incendio");
						System.out.println("Vou ativar os procedimentos de combate a incendio");			
						
					}else
						block();
				}// End action
				
			}
		});// End behaviour
	}

	protected void register(ServiceDescription service) {
		DFAgentDescription dfAgentDescription = new DFAgentDescription();
		dfAgentDescription.setName(getAID());
		dfAgentDescription.addServices(service);
		
		// Registering agent in DF
		try{
			DFService.register(this,dfAgentDescription);
		}catch(FIPAException fipaException){
			fipaException.printStackTrace();
		}
	}
	
	protected void takeDown() {
		try{
			DFService.deregister(this);
		}catch(FIPAException fipaE){
			fipaE.printStackTrace();
		}
	} 
}
