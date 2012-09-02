package brotherhood.states.gameplay.hud 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	
	public class Bar extends Core 
	{
		private var _bar:Core;
		
		private var _originalWidth:int;
		private var _originalHeight:int;
		
		private var _horizontal:Boolean;
		
		public var value:Number;
		public var maxValue:Number;
		
		public var reverse:Boolean;
		
		public function Bar() 
		{
			super();
		}
		
		public function build(width:int,height:int,startColour:uint,endColour:uint=0):void
		{
			_horizontal = width > height;
			
			_originalWidth = width;
			_originalHeight = height;
			
			_bar= new Core( new BitmapData(width, height, false, startColour));
			
			
			if (_horizontal)
			{
				_bar.alignAnchor( AnchorAlign.TOP,  AnchorAlign.LEFT);
			}
			else
			{
				_bar.alignAnchor( AnchorAlign.BOTTOM,  AnchorAlign.CENTER);
			}
			
			add(_bar);
			
			setCurrentDescendentsAsRelative();
		}
		
		public function setValues(value:Number, maxValue:Number):void
		{
			this.value = value;
			this.maxValue = maxValue;
		}
		
		override protected function update():void 
		{
			_bar.x = 0;
			
			if (value > maxValue)
			{
				value = maxValue;
			}
			else if (value < 0)
			{
				value = 0;
			}
			
			
			if (_horizontal)
			{
				_bar.scaleX = (value / maxValue);
				
				if (reverse && value != maxValue)
				{
					_bar.x = _originalWidth - _bar.width *_bar.scaleX;
				}
			}
			else
			{
				_bar.scaleY = (value / maxValue);
				
				if (reverse  && value != maxValue)
				{
					_bar.y =  _originalHeight - _bar.height * _bar.scaleY;
				}
			}
			
			super.update();
		}
		
	}

}