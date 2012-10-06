package brotherhood.states.gameplay.waves
{
	import brotherhood.states.gameplay.creeps.Creep;
	import brotherhood.states.gameplay.creeps.CreepService;
	import flash.geom.Point;
	import nemostein.utils.MathUtils;
	
	public class Wave
	{
		private var _creepDestructionCallbacks:Vector.<Function>;
		private var _creepDispatchCallbacks:Vector.<Function>;
		
		protected var id:String;
		protected var params:Array;
		protected var CreepClass:Class;
		protected var count:int;
		
		public var dispatched:Boolean;
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
		
		public function start():void
		{
			
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
					
					creep.x = Math.random() * 660 + 310;
					creep.y = Math.random() * 30 + 750;
					creep.wave = this;
					
					CreepService.add(creep);
				}
				
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
				if (alive == 0)
				{
					return true;
				}
			}
			
			return false;
		}
	}
}