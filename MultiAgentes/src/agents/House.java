package agents;

import java.util.Random;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.core.behaviours.OneShotBehaviour;
import jade.lang.acl.ACLMessage;
import jade.wrapper.AgentController;
import jade.wrapper.ControllerException;
import jade.wrapper.PlatformController;
import jade.wrapper.StaleProxyException;

public class House extends Agent {

	private static final long serialVersionUID = 1L;

	private static final int SIZE = 2;
	private int house[][] = new int[SIZE][SIZE];
	public static AgentController victimAgent;
	public static final int VICTIM = 1;
	public static final int FIRE = 0;

	public void setup() {
		super.setup();
		
		PlatformController container = getContainerController();

		createAgents(container);

		addBehaviour(new Location(this));
		
	}

	private void createAgents(PlatformController container) {
		try {

			this.victimAgent = container.createNewAgent("Vitima", "agents.Victim", null);

			System.out.println("Agente criado: " + this.victimAgent.getName());

			this.victimAgent.start();

		} catch (ControllerException e) {
			e.printStackTrace();
		}
	}

	private class Location extends CyclicBehaviour {

		private static final long serialVersionUID = 1L;

		public Location(Agent agent) {
			super(agent);

		}

		@Override
		public void action() {
			
			setVictimLocation();
			setFirePosition();

		}

		private void setFirePosition() {

			int fireMatrix[][] = new int[SIZE][SIZE];
			int line, column;

			Random random = new Random();

			line = random.nextInt(SIZE);
			column = random.nextInt(SIZE);

			for (int countLine = line; countLine <= SIZE; countLine++) {
				for (int countColumn = column; countColumn <= SIZE; countColumn++) {

					
					
					System.out.println("Incrementando  --->> X=" + countLine + " Y= " + countColumn);
					
					if(fireMatrix[countLine][countColumn] == VICTIM){
						
						System.out.println("valor do veotor: " + fireMatrix[countLine][countColumn]);
						
						System.out.println("Posição do fogo:  ( X = " + line + "  Y= " + column + ")");
						System.out.println("Vítima alcançada");
						continue;
					}else{
						fireMatrix[countLine][countColumn] = FIRE;
						System.out.println("entrou no else");
					}

				}
			}

		}

		private void setVictimLocation() {

			Random random = new Random();

			int x = 0;
			int y = 0;

			x = random.nextInt(SIZE);
			y = random.nextInt(SIZE);

				try {
					if (victimAgent.getName().equals(
							"Vitima@192.168.1.119:1099/JADE")) {

						System.out.println("Posição da vitima: (X= " + x
								+ "  Y= " + y + ") definida");
						 house[x][y] = VICTIM;
					}

				} catch (StaleProxyException e) {
					e.printStackTrace();
				}

			}

	}
}
