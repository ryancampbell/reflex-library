package reflex.skins.tableSkins
{	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import reflex.collections.SimpleCollection;
	import reflex.components.Button;
	import reflex.skins.Skin;
	import reflex.text.Label;
	
	public class CellSkin extends Skin
	{
		
		[Bindable]
		public var label:Label;
		
		public function CellSkin()
		{
			super();
			
			label = new Label();
			label.fontFamily = "Helvetica";
			label.fontSize = 12;
			label.padding = 5;
			content = new SimpleCollection([label]);
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
				target.graphics.clear();
				
				target.graphics.lineStyle( 1, 0x000000 );
				target.graphics.moveTo( 0, height );
				target.graphics.lineTo( 0, 0 );
				target.graphics.lineTo( width, 0 );
				
				target.graphics.lineStyle( 1, 0xCCCCCC );
				target.graphics.lineTo( width, height );
				target.graphics.lineTo( 0, height );
				
				/*target.graphics.lineStyle( 1, 0xBBBBBB );
				target.graphics.beginFill( 0xFFFFFF );
				target.graphics.drawRect( 0, 0, width, height );
				target.graphics.endFill();*/
			}
		}
		
	}
}