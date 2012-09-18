package brotherhood.states.gameplay.creeps.ranged 
{
	public class Normal extends Ranged
	{
		override protected function initialize():void 
		{
			super.initialize();
			
			addAnimation(WALKING, [0, 1], 7);
			playAnimation(WALKING);
		}
	}
}