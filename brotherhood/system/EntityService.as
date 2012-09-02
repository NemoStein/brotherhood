package brotherhood.system 
{
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.crosshair.Crosshair;
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.states.gameplay.heroes.wizard.Wizard;
	
	public class EntityService 
	{
		public static var archer:Archer;
		public static var wizard:Wizard;
		
		public static var player1:Hero;
		public static var player2:Hero;
		
		static public var player1Crosshair:Crosshair;
		static public var player2Crosshair:Crosshair;
	}
}