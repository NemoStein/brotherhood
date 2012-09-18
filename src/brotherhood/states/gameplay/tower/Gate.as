package brotherhood.states.gameplay.tower 
{
	public class Gate extends Tower 
	{
		private var _leftTower:Tower;
		private var _rightTower:Tower;
		
		public function Gate(leftTower:Tower, rightTower:Tower) 
		{
			_leftTower = leftTower;
			_rightTower = rightTower;
		}
		
		override public function hit(power:Number):void 
		{
			_leftTower.hit(power / 2);
			_rightTower.hit(power / 2);
		}
	}
}