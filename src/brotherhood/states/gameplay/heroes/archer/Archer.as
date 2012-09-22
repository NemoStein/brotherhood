package brotherhood.states.gameplay.heroes.archer
{
	import brotherhood.states.gameplay.heroes.archer.arrows.CommonArrow;
	import brotherhood.states.gameplay.heroes.Hero;
	
	public class Archer extends Hero
	{
		public function Archer(slot:String)
		{
			super(slot);
		}
		
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
			
			super.useSkill(value);
		}
		
		public function shoot():void
		{
			add(new CommonArrow(this));
		}
	}
}