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

	private static final int SIZE = 3;
	public static AgentController victimAgent;
	public static AgentController firefightAgent;
	public static final int VICTIM = 2;
	public static final int FIRE = 1;
	public static final int FIREFIGHT = 3;
	private int house[][] = { { 0, 0, 0 }, { 0, 0, 0 }, { 0, 0, 0 } };

	public void setup() {
		super.setup();

		PlatformController container = getContainerController();

		createAgents(container);

		addBehaviour(new Location(this));

	}

	private void createAgents(PlatformController container) {
		try {

			this.firefightAgent = container.createNewAgent("Bombeiro",
					"agents.Firefight", null);
			this.victimAgent = container.createNewAgent("Vitima",
					"agents.Victim", null);

			System.out.println("Agente criado: "
					+ this.firefightAgent.getName());
			System.out.println("Agente criado: " + this.victimAgent.getName());

			this.firefightAgent.start();
			this.victimAgent.start();

		} catch (ControllerException e) {
			System.out.println("O Agente nao foi criado");
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

			boolean victimSave = setFirefightLocation();

			for (int countLine = 0; countLine < house.length; countLine++) {
				for (int countColumn = 0; countColumn < house[countLine].length; countColumn++) {
					
					System.out.println("Fogo posicao:  Vetor posição " + house[countLine][countColumn]);
					System.out.println("Fogo posição da vitima" + VICTIM);
					

					if (house[countLine][countColumn] == VICTIM) {
						System.out.println("Posicao do fogo:  ( X = " + countLine + "  Y= " + countLine + ")");
						System.out.println("Vitima alcancada pelo fogo");
					} else {
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

			System.out.println("Posicao da vitima: (X= " + x + "  Y= " + y + ")");
			house[x][y] = VICTIM;

		}

		private boolean setFirefightLocation() {

			Random random = new Random();

			boolean isSave = false;
			int line = 0;
			int column = 0;

			line = random.nextInt(SIZE);       	System.out.println("Bombeiro randomico X: " +  line);
			column = random.nextInt(SIZE);         System.out.println("Bombeiro colum Y: " + column);

			for (int countLine = line; countLine < house.length; countLine++) {
				for (int countColumn = column; countColumn < house[countLine].length; countColumn++) {

					System.out.println("Posiçãodo bombeiro ( X = " + countLine + "  Y= " + countLine + ")");
					
					/*
					if (house[countLine][countColumn] == VICTIM) {
						System.out.println("Posicao do bombeiro:  ( X = " + countLine + "  Y= " + countLine + ")");
						System.out.println("Vitima Salva");
						isSave = true;
					} else {
						house[countLine][countColumn] = FIREFIGHT;
					} */
				}
			}

			return isSave;
		}
	}
}
