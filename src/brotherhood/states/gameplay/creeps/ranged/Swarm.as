package brotherhood.states.gameplay.creeps.ranged
{
	import assets.creeps.ranged.AssetSwarm;
	import nemostein.framework.dragonfly.AnchorAlign;
	
	public class Swarm extends Ranged
	{
		override protected function initialize():void
		{
			super.initialize();
			
			draw(new AssetSwarm().bitmapData);
			
			frame.width = 32;
			
			addAnimation(WALKING, [0, 1, 2, 3, 4, 5, 6, 7], 6);
			playAnimation(WALKING);
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
		}
	}
}