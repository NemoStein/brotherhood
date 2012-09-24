package brotherhood.states.gameplay.heroes.skills 
{
	public class Skill 
	{
		public var ready:Boolean;
		public var delay:Number;
		
		private var _time:Number;
		private var _level:int;
		
		public function Skill() 
		{
			ready = true;
			
			_time = 0;
			_level = 1;
		}
		
		public function upgrade():void 
		{
			_level++;
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
			ready = false;
		}
		
		public function readiness():Number 
		{
			if (ready)
			{
				return 1;
			}
			else
			{
				return _time / delay;
			}
		}
	}
}