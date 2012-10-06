package brotherhood.states.gameplay.creeps.melee 
{
	import assets.creeps.melee.AssetNormal1;
	import assets.creeps.melee.AssetNormal2;
	import assets.creeps.melee.AssetNormal3;
	import nemostein.framework.dragonfly.AnchorAlign;
	
	public class Normal extends Melee
	{
		override protected function initialize():void 
		{
			super.initialize();
			
			var random:Number = Math.random();
			
			if (random < 0.333)
			{
				draw(new AssetNormal1().bitmapData);
			}
			else if (random < 0.666)
			{
				draw(new AssetNormal2().bitmapData);
			}
			else
			{
				draw(new AssetNormal3().bitmapData);
			}
			
			frame.width = 48;
			
			addAnimation(WALKING, [0, 1], 7);
			playAnimation(WALKING);
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
		}
	}
}