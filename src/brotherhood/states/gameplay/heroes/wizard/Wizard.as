package brotherhood.states.gameplay.heroes.wizard
{
	import brotherhood.states.gameplay.heroes.crosshair.Crosshair;
	import brotherhood.states.gameplay.heroes.Hero;
	
	public class Wizard extends Hero
	{
		public function Wizard(slot:String) 
		{
			super(slot);
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
			add(new Ice(this));
		}
	}
}