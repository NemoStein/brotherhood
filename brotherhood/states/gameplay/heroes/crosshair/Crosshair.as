package brotherhood.states.gameplay.heroes.crosshair 
{
	import brotherhood.states.gameplay.hud.HUD;
	import nemostein.framework.dragonfly.Core;
	
	
	public class Crosshair extends Core 
	{
		private var _heroType:String;
		
		public function Crosshair(heroType:String):void
		{
			_heroType = heroType;
			
			if (_heroType == HUD.ARCHER)
			{
				
			}
			else
			{
				
			}
		}
		
	}

}