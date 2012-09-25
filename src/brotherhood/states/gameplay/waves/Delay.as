package brotherhood.states.gameplay.waves
{
	import brotherhood.states.gameplay.creeps.Creep;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Delay extends Wave
	{
		private var _waveReference:Wave;
		private var _dispatchTime:Number;
		private var _dispatchDelay:Number;
		
		override protected function initialize(params:Array):void
		{
			try
			{
				_waveReference = params[0];
				_dispatchDelay = Number(params[1]);
			}
			catch (error:Error)
			{
				trace(this, "\"" + params[0] + "\" isn't a valid wave reference.");
			}
			
			_dispatchTime = 0;
			
			if (isNaN(_dispatchDelay))
			{
				trace(this, "\"" + params[1] + "\" isn't a valid number.");
			}
			
			super.initialize(params);
		}
		
		override public function update(time:Number):Boolean
		{
			if (_waveReference.dispatched && !dispatched)
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