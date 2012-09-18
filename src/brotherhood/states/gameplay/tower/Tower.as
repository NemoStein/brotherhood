package brotherhood.states.gameplay.tower 
{
	import brotherhood.states.gameplay.Target;
	import brotherhood.system.SystemService;
	
	public class Tower implements Target
	{
		public var currentHP:Number = 100;
		public var totalHP:Number = 100;
		
		public function hit(power:Number):void 
		{
			currentHP -= power;
		}
	}
}