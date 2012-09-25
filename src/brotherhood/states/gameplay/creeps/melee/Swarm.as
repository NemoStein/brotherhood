package brotherhood.states.gameplay.creeps.melee 
{
	public class Swarm extends Melee
	{
		override protected function initialize():void 
		{
			super.initialize();
			
			addAnimation(WALKING, [0, 1], 3);
			playAnimation(WALKING);
		}
	}
}