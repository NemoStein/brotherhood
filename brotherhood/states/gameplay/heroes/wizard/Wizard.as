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
			var ice:Ice = new Ice();
			
			add(ice);
			
			ice.x = x;
			ice.y = y - height/2;
		}
	}
}