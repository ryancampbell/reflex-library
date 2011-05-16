package reflex.skins
{
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	import reflex.collections.SimpleCollection;
	import reflex.display.Display;

	public class OSXVSliderSkin extends Skin
	{
		
		[Bindable]
		public var thumb:Display;
		
		[Bindable]
		public var track:Display;
		
		public function OSXVSliderSkin()
		{
			super();
			
			track = new Display();
			thumb = new Display();
			content = new SimpleCollection([track, thumb]);
		}
		
		override public function set target(value:Sprite):void
		{
			if (target)
				target.removeEventListener(Skin.LAYOUT, target_layoutHandler);
			
			super.target = value;
			
			if (target)
				target.addEventListener(Skin.LAYOUT, target_layoutHandler);
		}
		
		private function target_layoutHandler( event:Event ):void
		{
			
			track.y = 5;
			track.setSize( target.width, target.height - 20 );
			
			thumb.x = 1;
			thumb.setSize( target.width - 3, 30 );
			
			target.graphics.clear();
			target.graphics.lineStyle( 1, 0xC6C6C6 );
			target.graphics.beginFill( 0xF7F7F7 );
			target.graphics.drawRect( 0, 0, target.width, target.height );
			target.graphics.endFill();
			
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox( target.width, target.height, 0 );
			
			track.graphics.clear();
			track.graphics.lineStyle( 1, 0xC6C6C6 );
			track.graphics.beginGradientFill( GradientType.LINEAR, [ 0xC6C6C6, 0xF7F7F7, 0xF7F7F7, 0xD8D8D8 ], [ 1, 1, 1, 1 ], [ 0, 100, 150, 255 ], matrix );
			track.graphics.drawRoundRect( 0, 0, track.width, track.height, 10, 10 );
			track.graphics.endFill();
			
			matrix = new Matrix();
			matrix.createGradientBox( thumb.width, thumb.height, 0 );
			
			thumb.graphics.clear();
			thumb.graphics.lineStyle( 1, 0x8F9FB9 );
			thumb.graphics.beginGradientFill( GradientType.LINEAR, [ 0xB4BECC, 0x828EA5 ], [ 1, 1 ], [ 0, 255 ], matrix );
			thumb.graphics.drawRoundRect( 0, 0, thumb.width, thumb.height, 10, 10 );
			thumb.graphics.endFill();
		}
	}
}