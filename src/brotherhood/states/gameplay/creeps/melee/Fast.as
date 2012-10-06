package brotherhood.states.gameplay.creeps.melee 
{
	import assets.creeps.melee.AssetFast;
	import nemostein.framework.dragonfly.AnchorAlign;
	
	public class Fast extends Melee
	{
		override protected function initialize():void 
		{
			super.initialize();
			
			draw(new AssetFast().bitmapData);
			
			frame.width = 64;
			
			addAnimation(WALKING, [0, 1], 6);
			playAnimation(WALKING);
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
		}
	}
}