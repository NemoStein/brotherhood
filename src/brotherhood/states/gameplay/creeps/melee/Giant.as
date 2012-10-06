package brotherhood.states.gameplay.creeps.melee 
{
	import assets.creeps.melee.AssetGiant;
	import nemostein.framework.dragonfly.AnchorAlign;
	
	public class Giant extends Melee
	{
		override protected function initialize():void 
		{
			super.initialize();
			
			draw(new AssetGiant().bitmapData);
			
			frame.width = 64;
			
			addAnimation(WALKING, [0, 1, 2, 3, 4, 5], 6);
			playAnimation(WALKING);
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
		}
	}
}