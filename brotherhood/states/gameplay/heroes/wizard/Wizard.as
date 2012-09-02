package brotherhood.states.gameplay.heroes.wizard
{
	import brotherhood.states.gameplay.heroes.Hero;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	
	public class Wizard extends Hero
	{
		override protected function initialize():void
		{
			super.initialize();
			
			frame.width = 40;
			frame.height = 60;
			
			sprite = new BitmapData(frame.width, frame.height, true, 0);
			sprite.fillRect(new Rectangle(0, 10, 40, 50), 0xff0000ff);
			sprite.fillRect(new Rectangle(10, 0, 20, 20), 0xff000080);
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
		}
	}
}