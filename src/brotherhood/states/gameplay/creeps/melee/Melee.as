package brotherhood.states.gameplay.creeps.melee
{
	import brotherhood.states.gameplay.creeps.Creep;
	import brotherhood.system.EntityService;
	import flash.geom.Point;
	
	internal class Melee extends Creep
	{
		override protected function initialize():void
		{
			super.initialize();
		}
		
		override protected function attackTarget():void 
		{
			super.attackTarget();
		}
		
		override protected function update():void
		{
			if (arivedAtDestination)
			{
				if (!target)
				{
					if (x < 510)
					{
						target = EntityService.leftTower;
					}
					else if (x < 770)
					{
						target = EntityService.gate;
					}
					else
					{
						target = EntityService.rightTower;
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