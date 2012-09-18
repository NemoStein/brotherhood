package brotherhood.states.gameplay.hud
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class Bar extends Core
	{
		private var _bar:Core;
		
		private var _totalWidth:int;
		private var _totalHeight:int;
		
		private var _startColour:uint;
		private var _endColour:uint;
		
		private var _horizontal:Boolean;
		
		protected var value:Number;
		protected var maxValue:Number;
		
		public var reverse:Boolean;
		
		public function Bar(width:int, height:int, startColour:uint, endColour:uint = 0, vertical:Boolean = false)
		{
			_totalWidth = width;
			_totalHeight = height;
			
			_startColour = startColour;
			_endColour = endColour;
			
			_horizontal = !vertical;
			
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			relative = false;
			
			_bar = new Core(new BitmapData(_totalWidth, _totalHeight, true, _startColour));
			
			if (_horizontal)
			{
				_bar.alignAnchor(AnchorAlign.TOP, AnchorAlign.LEFT);
			}
			else
			{
				_bar.alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
			}
			
			add(_bar);
		}
		
		override protected function update():void
		{
			if (_horizontal)
			{
				_bar.scaleX = (value / maxValue);
				
				if (reverse)
				{
					_bar.x = _totalWidth - _bar.width * _bar.scaleX;
				}
			}
			else
			{
				_bar.scaleY = (value / maxValue);
				
				if (reverse)
				{
					_bar.y = _totalHeight - _bar.height * _bar.scaleY;
				}
			}
			
			super.update();
		}
	}
}