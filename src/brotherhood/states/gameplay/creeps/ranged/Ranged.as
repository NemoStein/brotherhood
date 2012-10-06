package brotherhood.states.gameplay.creeps.ranged
{
	import assets.creeps.melee.AssetNormal1;
	import assets.creeps.melee.AssetNormal2;
	import assets.creeps.melee.AssetNormal3;
	import brotherhood.states.gameplay.creeps.Creep;
	import brotherhood.system.EntityService;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	
	internal class Ranged extends Creep
	{
		protected var maxRange:Number;
		protected var minRange:Number;
		
		override protected function initialize():void
		{
			super.initialize();
			
			minRange = 100;
			maxRange = 150;
		}
		
		override protected function update():void
		{
			if (arivedAtDestination)
			{
				if (!target)
				{
					target = x < 640 ? EntityService.slot1 : EntityService.slot2;
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