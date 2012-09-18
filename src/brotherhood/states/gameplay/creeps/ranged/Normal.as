package brotherhood.states.gameplay.creeps.ranged 
{
	import nemostein.framework.dragonfly.Animation;
	public class Normal extends Ranged
	{
		override protected function initialize():void 
		{
			super.initialize();
			
			addAnimation(new Animation(WALKING, [0, 1], 7));
			playAnimation(WALKING);
		}
	}
}