package brotherhood.states.gameplay.waves 
{
	import brotherhood.states.gameplay.creeps.Creep;
	import brotherhood.states.State;
	import nemostein.framework.dragonfly.Core;
	public class Alive extends Wave
	{
		private var _waveReference:Wave;
		private var _creepsAlive:int;
		
		override protected function initialize(params:Array):void 
		{
			try
			{
				_waveReference = params[0];
				_creepsAlive = int(params[1]);
			}
			catch (error:Error)
			{
				trace("\"" + params[0] + "\" isn't a valid wave reference.");
			}
			
			super.initialize(params);
		}
		
		
		override public function start():void 
		{
			if(_waveReference)
			{
				_waveReference.onCreepDestruction(waveReferenceCreepDestruction);
			}
			
			super.start();
		}
		
		private function waveReferenceCreepDestruction(destroyed:Creep, stillAlive:int):void 
		{
			if (!dispatched && stillAlive <= _creepsAlive)
			{
				dispatchCreeps();
			}
		}
	}
}