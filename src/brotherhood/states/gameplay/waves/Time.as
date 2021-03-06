package brotherhood.states.gameplay.waves
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Time extends Wave
	{
		private var _dispatchDelay:Number;
		private var _dispatchTime:Number;
		
		override protected function initialize(params:Array):void
		{
			_dispatchDelay = Number(params[0]);
			_dispatchTime = 0;
			
			if (isNaN(_dispatchDelay))
			{
				trace(this, "\"" + params[0] + "\" isn't a valid number.");
			}
			
			super.initialize(params);
		}
		
		override public function update(time:Number):Boolean
		{
			if (!dispatched)
			{
				_dispatchTime += time;
				
				if (_dispatchTime >= _dispatchDelay)
				{
					dispatchCreeps();
				}
			}
			
			return super.update(time);
		}
	}
}