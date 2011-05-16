package reflex.skins.tableSkins
{
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	import reflex.collections.SimpleCollection;
	import reflex.containers.Container;
	import reflex.skins.Skin;
	
	public class TableHeaderSkin extends Skin
	{
		
		[Bindable]
		public var container:Container;
		
		public function TableHeaderSkin()
		{
			super();
			
			container = new Container();
			content = new SimpleCollection([container]);
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
			if ( width > 0 && height > 0 )
			{
				var matrix:Matrix = new Matrix();
				matrix.createGradientBox( width, height, Math.PI / 2 );
			
				target.graphics.clear();
				target.graphics.lineStyle( 1, 0xA6A6A6 );
				target.graphics.beginGradientFill( GradientType.LINEAR, [ 0xDCDCDC, 0xEEEEEE, 0xFFFFFF ], [ 1.0, 1.0, 1.0 ], [ 0, 32, 255 ], matrix );
				target.graphics.drawRoundRect( 0, 0, width - 1, height - 1, 5, 5 );
				target.graphics.endFill();
			}
		}
	}
}