package brotherhood.states.gameplay.heroes.archer 
{
	import brotherhood.states.gameplay.heroes.Hero;
	
	public class Archer extends Hero 
	{
		override protected function initialize():void 
		{
			super.initialize();
			
			frame.y = 50;
		}
	}
}