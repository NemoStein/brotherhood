package brotherhood.states.gameplay.waves
{
	import brotherhood.states.gameplay.creeps.Creep;
	import nemostein.framework.dragonfly.Core;
	
	public class Wave
	{
		private var _creepDestructionCallbacks:Vector.<Function>;
		private var _creepDispatchCallbacks:Vector.<Function>;
		
		protected var id:String;
		protected var params:Array;
		protected var CreepClass:Class;
		protected var count:int;
		
		protected var container:Core;
		protected var dispatched:Boolean;
		
		public var alive:int;
		
		public final function construct(id:String, params:Array, CreepClass:Class, count:int):void
		{
			this.id = id;
			this.params = params;
			this.CreepClass = CreepClass;
			this.count = count;
			
			_creepDestructionCallbacks = new Vector.<Function>();
			_creepDispatchCallbacks = new Vector.<Function>();
			
			initialize(params);
		}
		
		protected function initialize(params:Array):void
		{
		
		}
		
		public function start(container:Core):void
		{
			this.container = container;
		}
		
		public function onCreepDestruction(callback:Function):void
		{
			_creepDestructionCallbacks.push(callback);
		}
		
		public function onCreepDispatch(callback:Function):void
		{
			_creepDispatchCallbacks.push(callback);
		}
		
		public function destroyCreep(creep:Creep):void
		{
			--alive;
			
			// DELETE: wave sequence test
			trace("Killing a bot from wave " + id + " (" + alive + " alive now)");
			
			for (var i:int = 0; i < _creepDestructionCallbacks.length; i++)
			{
				var callback:Function = _creepDestructionCallbacks[i];
				
				callback(creep, alive);
			}
		}
		
		public function dispatchCreeps():void
		{
			if (!dispatched)
			{
				alive = count;
				
				for (var i:int = 0; i < count; ++i)
				{
					var creep:Creep = new CreepClass();
					
					creep.x = Math.random() * 800 + 250;
					creep.y = Math.random() * 30 + 750;
					
					container.add(creep);
				}
				
				// DELETE: wave sequence test
				trace("Dispatching " + count + " bots from wave " + id);
				for (var j:int = 0; j < _creepDispatchCallbacks.length; ++j)
				{
					var callback:Function = _creepDispatchCallbacks[j];
					
					callback();
				}
				
				dispatched = true;
			}
		}
		
		public function update(time:Number):Boolean
		{
			if (dispatched)
			{
				// DELETE: wave sequence test
				destroyCreep(null);
				
				if (alive == 0)
				{
					// DELETE: wave sequence test
					trace("All bots are dead in wave " + id);
					return true;
				}
			}
			
			return false;
		}
	}
}