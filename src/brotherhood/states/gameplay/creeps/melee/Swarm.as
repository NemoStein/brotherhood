package brotherhood.states.gameplay.creeps.melee 
{
	import assets.creeps.melee.AssetSwarm;
	import nemostein.framework.dragonfly.AnchorAlign;
	
	public class Swarm extends Melee
	{
		override protected function initialize():void 
		{
			super.initialize();
			
			draw(new AssetSwarm().bitmapData);
			
			frame.width = 33;
			
			addAnimation(WALKING, [0, 1], 6);
			playAnimation(WALKING);
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
		}
	}
}