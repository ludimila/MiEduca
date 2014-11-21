package agents;

import java.util.Random;

import jade.core.Agent;
import jade.core.behaviours.OneShotBehaviour;
import jade.wrapper.AgentController;
import jade.wrapper.ControllerException;
import jade.wrapper.PlatformController;
import jade.wrapper.StaleProxyException;

public class House extends Agent {

	private static final long serialVersionUID = 1L;

	private static final int SIZE = 10;
	public static AgentController victimAgent;
	public static final int VICTIM = 2;
	public static final int FIRE = 1;
	private int house[][] = {{0,0,0}, {0,0,0}, {0,0,0}};

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
			System.out.println("o Agente não foi criado");
			e.printStackTrace();
		}
	}

	private class Location extends OneShotBehaviour {

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

			for (int countLine = 0; countLine < house.length; countLine++) {
				for (int countColumn = 0; countColumn < house[countLine].length; countColumn++) {
					
					if(house[countLine][countColumn] == VICTIM){
						System.out.println("Posição do fogo:  ( X = " + countLine + "  Y= " + countLine + ")");
						System.out.println("Vítima alcançada pelo fogo");
					}else{
						house[countLine][countColumn] = FIRE;
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
					
					if (victimAgent.getName().equals("Vitima@192.168.25.16:1099/JADE")) {

						System.out.println("Posição da vitima: (X= " + x + "  Y= " + y);
						 house[x][y] = VICTIM;
					}

				} catch (StaleProxyException e) {
					e.printStackTrace();
				}

			}
	}
}
