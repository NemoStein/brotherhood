package brotherhood.states.gameplay.heroes.archer 
{
	import brotherhood.states.gameplay.heroes.archer.arrows.CommonArrow;
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.system.EntityService;
	
	public class Archer extends Hero 
	{
		override protected function initialize():void 
		{
			super.initialize();
			
			frame.y = 50;
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
			add(new CommonArrow());
		}
	}
}