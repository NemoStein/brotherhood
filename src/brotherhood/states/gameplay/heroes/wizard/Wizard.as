package brotherhood.states.gameplay.heroes.wizard
{
	import brotherhood.states.gameplay.heroes.archer.arrows.CommonArrow;
	import brotherhood.states.gameplay.heroes.Hero;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Animation;
	
	public class Wizard extends Hero
	{
		public function Wizard(slot:String) 
		{
			super(slot);
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			
		}
		
		override public function useSkill(value:int):void 
		{
			if (value == 1)
			{
				shoot();
			}
		}
		
		public function shoot():void
		{
			add(new Ice());
		}
	}
}