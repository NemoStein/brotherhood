package brotherhood.states.gameplay.heroes.archer 
{
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.states.gameplay.hud.HUD;
	import brotherhood.system.EntityService;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	
	public class Archer extends Hero 
	{
		override protected function initialize():void 
		{
			super.initialize();
			
			frame.y = 50;
		}
		
		override protected function update():void 
		{
			if (input.justPressed(HUD.P1_GB))
			{
				playAnimation(LOOK_LEFT);
			}
			else if (input.justPressed(HUD.P1_BB))
			{
				playAnimation(LOOK_MIDDLE);
			}
			else if (input.justPressed(HUD.P1_RB))
			{
				playAnimation(LOOK_RIGHT);
			}
			
			super.update();
		}
	}
}