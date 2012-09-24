package brotherhood.states.gameplay.heroes.skills 
{
	public class Skill 
	{
		public var ready:Boolean;
		public var delay:Number;
		
		private var _time:Number;
		
		public function Skill() 
		{
			ready = true;
		}
		
		public function update(time:Number):void 
		{
			if (!ready)
			{
				_time += time;
				
				if (_time >= delay)
				{
					_time -= delay;
					ready = true;
				}
			}
		}
		
		public function activate():void 
		{
			
		}
		
		public function readiness():Number 
		{
			return _time / delay;
		}
	}
}