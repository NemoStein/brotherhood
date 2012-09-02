package brotherhood.states.gameplay.creeps.melee
{
	import brotherhood.states.gameplay.creeps.Creep;
	import brotherhood.states.gameplay.tower.Tower;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	
	internal class Melee extends Creep
	{
		protected var target:Tower;
		
		override protected function initialize():void
		{
			super.initialize();
			
			draw(new BitmapData(15, 15, true, 0xffdf4030));
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
		}
		
		override protected function update():void
		{
			if (arivedAtDestination)
			{
				if (!target)
				{
					if (x < 500)
					{
						target = null;
					}
					else if (x < 800)
					{
						target = null;
					}
					else
					{
						target = null;
					}
				}
				
				attackTarget();
			}
			else if (!destination)
			{
				destination = new Point();
				
				// TODO: Ajust lanes here
				if (x < 500)
				{
					destination.x = Math.random() * leftTowerBase.width + leftTowerBase.x;
					destination.y = Math.random() * leftTowerBase.height + leftTowerBase.y;
				}
				else if (x < 800)
				{
					destination.x = Math.random() * gateBase.width + gateBase.x;
					destination.y = Math.random() * gateBase.height + gateBase.y;
				}
				else
				{
					destination.x = Math.random() * rightTowerBase.width + rightTowerBase.x;
					destination.y = Math.random() * rightTowerBase.height + rightTowerBase.y;
				}
			}
			
			super.update();
		}
	}
}