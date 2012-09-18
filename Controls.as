package  
{
	import brotherhood.states.gameplay.heroes.crosshair.Crosshair;
	import brotherhood.system.EntityService;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
	public class Controls extends Core
	{
		static public var Slot1GreenA:int = Keys.U;
		static public var Slot1GreenB:int = Keys.J;
		static public var Slot1BlueA:int = Keys.I;
		static public var Slot1BlueB:int = Keys.K;
		static public var Slot1RedA:int = Keys.O;
		static public var Slot1RedB:int = Keys.L;
		static public var Slot1Up:int = Keys.W;
		static public var Slot1Down:int = Keys.S;
		static public var Slot1Left:int = Keys.A;
		static public var Slot1Right:int = Keys.D;
		static public var Slot1Start:int = Keys.ENTER;
		
		static public var Slot2GreenA:int = Keys.ANY;
		static public var Slot2GreenB:int = Keys.ANY;
		static public var Slot2BlueA:int = Keys.ANY;
		static public var Slot2BlueB:int = Keys.ANY;
		static public var Slot2RedA:int = Keys.ANY;
		static public var Slot2RedB:int = Keys.ANY;
		static public var Slot2Up:int = Keys.ANY;
		static public var Slot2Down:int = Keys.ANY;
		static public var Slot2Left:int = Keys.ANY;
		static public var Slot2Right:int = Keys.ANY;
		static public var Slot2Start:int = Keys.ANY;
		
		override protected function update():void 
		{
			if (input.justPressed(Slot1GreenA))
			{
				EntityService.archer.useSkill(1);
				EntityService.wizard.useSkill(1);
			}
			
			super.update();
		}
	}
}