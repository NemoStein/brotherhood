package brotherhood.states.gameplay.creeps.melee 
{
	import nemostein.framework.dragonfly.Animation;
	
	public class Normal extends Melee
	{
		override protected function initialize():void 
		{
			super.initialize();
			
			addAnimation(new Animation(WALKING, [0, 1], 3));
			playAnimation(WALKING);
		}
	}
}