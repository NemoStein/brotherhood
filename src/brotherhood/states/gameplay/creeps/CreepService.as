package brotherhood.states.gameplay.creeps 
{
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	public class CreepService
	{
		static public var container:Core;
		
		static private var creeps:Vector.<Creep>;
		{
			creeps = new Vector.<Creep>();
		}
		
		static public function add(creep:Creep):void 
		{
			creeps.push(creep);
			container.add(creep);
		}
		
		static public function remove(creep:Creep):void 
		{
			creeps.splice(creeps.indexOf(creep), 1);
			container.remove(creep);
		}
		
		static public function hitCreep(point:Point):void 
		{
			for (var i:int = 0; i < creeps.length; ++i) 
			{
				var creep:Creep = creeps[i];
				
				if (creep.isInside(point))
				{
					creep.hit(1);
					return;
				}
			}
		}
	}
}