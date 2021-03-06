package brotherhood.system
{
	import brotherhood.states.endgame.defeat.Defeat;
	import brotherhood.states.endgame.victory.Victory;
	import brotherhood.states.gameplay.GamePlay;
	import brotherhood.states.startmenu.StartMenu;
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
		static private var _gameEnded:Boolean;
		
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
			if(_currentState)
			{
				_stateLayer.remove(_currentState);
			}
			
			_currentState = getState(stateClass);
			_stateLayer.add(_currentState);
			
			if (_currentState is StartMenu)
			{
				_gameEnded = false;
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
		
		static public function defeat():void 
		{
			if(!_gameEnded)
			{
				_gameEnded = true;
				changeState(Defeat);
			}
		}
		
		static public function victory():void 
		{
			if(!_gameEnded)
			{
				_gameEnded = true;
				changeState(Victory);
			}
		}
		
		static private function getState(stateClass:Class):State
		{
			return new stateClass();
			
			if (!_states[stateClass])
			{
				_states[stateClass] = new stateClass();
			}
			
			return _states[stateClass];
		}
	}
}