package brotherhood.states.gameplay.hud 
{
	import flash.display.BitmapData;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	
	public class Bar extends Core 
	{
		private var _background:Core;
		private var _foreground:Core;
		
		private var _horizontal:Boolean;
		
		public var value:Number;
		public var maxValue:Number;
		
		public function Bar() 
		{
			super();
		}
		
		public function build(width:int,height:int,startColour:uint,endColour:uint=0):void
		{
			_horizontal = width > height;
			
			_background = new Core( new BitmapData(width, height, false, 0));
			_foreground = new Core( new BitmapData(width, height, false, startColour));
			
			if (_horizontal)
			{
				_foreground.alignAnchor( AnchorAlign.TOP,  AnchorAlign.LEFT);
			}
			else
			{
				_foreground.alignAnchor( AnchorAlign.BOTTOM,  AnchorAlign.LEFT);
			}
			
			add(_background);
			add(_foreground);
		}
		
		public function setValues(value:Number, maxValue:Number):void
		{
			this.value = value;
			this.maxValue = maxValue;
		}
		
		override protected function update():void 
		{
			if (value > maxValue)
			{
				value = maxValue;
			}
			else if (value < 0)
			{
				value = 0;
			}
			
			_foreground.scaleX = (value / maxValue);
			
			super.update();
		}
		
	}

}