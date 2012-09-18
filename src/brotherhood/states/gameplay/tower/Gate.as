package brotherhood.states.gameplay.tower 
{
	import brotherhood.system.EntityService;
	
	public class Gate extends Tower 
	{
		private var _leftTower:Tower;
		private var _rightTower:Tower;
		
		public function Gate() 
		{
			_leftTower = EntityService.leftTower;
			_rightTower = EntityService.rightTower;
		}
		
		override public function hit(power:Number):void 
		{
			_leftTower.hit(power / 2);
			_rightTower.hit(power / 2);
		}
	}
}