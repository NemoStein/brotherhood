package brotherhood.states.gameplay.waves
{
	import brotherhood.states.gameplay.creeps.Creep;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class AliveDelay extends Wave
	{
		private var _waveReference:Wave;
		private var _creepsAlive:int;
		private var _dispatchTime:Number;
		private var _dispatchDelay:Number;
		private var _referenceWaveCreepsDied:Boolean;
		
		override protected function initialize(params:Array):void
		{
			try
			{
				_waveReference = params[0];
				_creepsAlive = int(params[1]);
				_dispatchDelay = Number(params[2]);
			}
			catch (error:Error)
			{
				trace(this, "\"" + params[0] + "\" isn't a valid wave reference.");
			}
			
			_dispatchTime = 0;
			
			if (isNaN(_dispatchDelay))
			{
				trace(this, "\"" + params[2] + "\" isn't a valid number.");
			}
			
			super.initialize(params);
		}
		
		override public function start():void
		{
			if (_waveReference)
			{
				_waveReference.onCreepDestruction(waveReferenceCreepDestruction);
			}
			
			super.start();
		}
		
		private function waveReferenceCreepDestruction(destroyed:Creep, stillAlive:int):void
		{
			if (!_referenceWaveCreepsDied && stillAlive <= _creepsAlive)
			{
				_referenceWaveCreepsDied = true;
			}
		}
		
		override public function update(time:Number):Boolean
		{
			if (_referenceWaveCreepsDied && !dispatched)
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