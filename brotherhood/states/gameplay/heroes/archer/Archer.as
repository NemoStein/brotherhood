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
			
			frame.width = 40;
			frame.height = 60;
			
			sprite = new BitmapData(frame.width, frame.height, true, 0);
			sprite.fillRect(new Rectangle(0, 10, 40, 50), 0xff00ff00);
			sprite.fillRect(new Rectangle(10, 0, 20, 20), 0xff008000);
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
		}
		
		override protected function update():void 
		{
			if (input.pressed(Controls.P1_GA))
			{
				trace(EntityService.player1Crosshair.radius);
			}
			
			super.update();
		}
	}
}