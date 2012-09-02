package brotherhood.states
{
	import brotherhood.system.SystemService;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	
	public class State extends Core
	{
		static public const SWIPE_READY:int = -1;
		static public const SWIPE_UP:int = 0;
		static public const SWIPE_RIGHT:int = 1;
		static public const SWIPE_DOWN:int = 2;
		static public const SWIPE_LEFT:int = 3;
		
		private var _swipe:int;
		private var _swipeSpeed:Number;
		private var _swipeMove:Number;
		private var _swipeMoveDistance:Number;
		private var _swipeOrigin:Point;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_swipeSpeed = 100;
			_swipe = SWIPE_READY;
			
			//setCurrentDescendentsAsRelative();
		}
		
		public function swipeTo(direction:int, distance:int):void
		{
			if (_swipe == SWIPE_READY)
			{
				_swipe = direction;
				
				_swipeMove = 0;
				_swipeSpeed = 100;
				_swipeOrigin = position.clone();
				
				_swipeMoveDistance = distance
			}
		}
		
		override protected function update():void
		{
			if (_swipe != SWIPE_READY)
			{
				var move:Number = _swipeSpeed * time;
				_swipeSpeed *= 1 + time * 5;
				
				if (_swipe == SWIPE_UP)
				{
					y -= move;
				}
				else if (_swipe == SWIPE_DOWN)
				{
					y += move;
				}
				else if (_swipe == SWIPE_LEFT)
				{
					x -= move;
				}
				else if (_swipe == SWIPE_RIGHT)
				{
					x += move;
				}
				
				_swipeMove += move;
				
				if (_swipeMove >= _swipeMoveDistance)
				{
					if (_swipe == SWIPE_UP)
					{
						y = _swipeOrigin.y - _swipeMoveDistance;
					}
					else if (_swipe == SWIPE_DOWN)
					{
						y = _swipeOrigin.y + _swipeMoveDistance;
					}
					else if (_swipe == SWIPE_LEFT)
					{
						x = _swipeOrigin.x - _swipeMoveDistance;
					}
					else if (_swipe == SWIPE_RIGHT)
					{
						x = _swipeOrigin.x + _swipeMoveDistance;
					}
					
					_swipeMove = _swipeMoveDistance;
					
					SystemService.swipeFinished(this);
					
					_swipe = SWIPE_READY;
				}
			}
			else
			{
				stateUpdate();
			}
		}
		
		protected function stateUpdate():void
		{
			super.update();
		}
	}
}