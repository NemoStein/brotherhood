package brotherhood.system
{
	import brotherhood.states.State;
	import flash.utils.Dictionary;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Game;
	
	public class SystemService
	{
		static private var _game:Game;
		static private var _states:Dictionary;
		static private var _stateLayer:Core;
		
		static private var _nextState:State;
		static private var _currentState:State;
		static private var _nextStateSwipeFinished:Boolean;
		static private var _currentStateSwipeFinished:Boolean;
		
		static public function registerGame(game:Game):void
		{
			if (!_game)
			{
				_game = game;
				
				_states = new Dictionary();
				_stateLayer = new Core();
				
				_game.add(_stateLayer);
			}
		}
		
		static public function changeState(stateClass:Class):void
		{
			_nextState = getState(stateClass);
			_stateLayer.add(_nextState);
			
			if (_currentState)
			{
				var direction:int = int(Math.random() * 4);
				var distance:int;
				
				if (direction == State.SWIPE_UP)
				{
					_nextState.y = _game.height;
					distance = _game.height;
				}
				else if (direction == State.SWIPE_DOWN)
				{
					_nextState.y = -_game.height;
					distance = _game.height;
				}
				else if (direction == State.SWIPE_LEFT)
				{
					_nextState.x = _game.width;
					distance = _game.width;
				}
				else if (direction == State.SWIPE_RIGHT)
				{
					_nextState.x = -_game.width;
					distance = _game.width;
				}
				
				_nextState.swipeTo(direction, distance);
				_currentState.swipeTo(direction, distance);
			}
			else
			{
				_currentState = _nextState;
			}
		}
		
		static public function swipeFinished(state:State):void
		{
			if (state == _nextState)
			{
				_nextStateSwipeFinished = true;
			}
			else if (state == _currentState)
			{
				_currentStateSwipeFinished = true;
			}
			
			if (_nextStateSwipeFinished && _currentStateSwipeFinished)
			{
				_nextStateSwipeFinished = false;
				_currentStateSwipeFinished = false;
				
				_stateLayer.remove(_currentState);
				_currentState = _nextState;
				_nextState = null;
			}
		}
		
		static private function getState(stateClass:Class):State
		{
			if (!_states[stateClass])
			{
				_states[stateClass] = new stateClass();
			}
			
			return _states[stateClass];
		}
	}
}