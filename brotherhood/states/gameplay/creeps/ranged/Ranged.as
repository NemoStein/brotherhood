package brotherhood.states.gameplay.creeps.ranged
{
	import brotherhood.states.gameplay.creeps.Creep;
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.system.EntityService;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	
	internal class Ranged extends Creep
	{
		protected var maxRange:Number;
		protected var minRange:Number;
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(Bitmap(new Assets.ImageCreepsCreeps).bitmapData);
			
			frame.x = 0;
			frame.y = 385;
			frame.width = 65;
			frame.height = 65;
			
			//draw(new BitmapData(15, 15, true, 0xff4030df));
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
			
			minRange = 100;
			maxRange = 150;
		}
		
		override protected function update():void
		{
			if (arivedAtDestination)
			{
				if (!target)
				{
					target = x < 640 ? EntityService.player1 : EntityService.player2;
				}
				
				attackTarget();
			}
			else if (!destination)
			{
				destination = new Point();
				
				destination.x = x;
				destination.y = Math.random() * (maxRange - minRange) + maxRange + gateBase.bottom;
			}
			
			super.update();
		}
	}
}