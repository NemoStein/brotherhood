package brotherhood.system 
{
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.crosshair.Crosshair;
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.states.gameplay.heroes.wizard.Wizard;
	import brotherhood.states.gameplay.tower.Gate;
	import brotherhood.states.gameplay.tower.Tower;
	
	public class EntityService 
	{
		static public var archer:Archer;
		static public var wizard:Wizard;
		
		static public var slot1:Hero;
		static public var slot2:Hero;
		
		static public var leftTower:Tower;
		static public var rightTower:Tower;
		static public var gate:Gate;
		
		static public var slot1Crosshair:Crosshair;
		static public var slot2Crosshair:Crosshair;
	}
}