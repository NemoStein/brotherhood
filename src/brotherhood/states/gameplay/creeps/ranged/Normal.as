package brotherhood.states.gameplay.creeps.ranged
{
	import assets.creeps.ranged.AssetNormal;
	import nemostein.framework.dragonfly.AnchorAlign;
	
	public class Normal extends Ranged
	{
		override protected function initialize():void
		{
			super.initialize();
			
			draw(new AssetNormal().bitmapData);
			
			frame.width = 48;
			
			addAnimation(WALKING, [0, 1, 2, 3, 4, 5, 6, 7], 6);
			playAnimation(WALKING);
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
		}
	}
}