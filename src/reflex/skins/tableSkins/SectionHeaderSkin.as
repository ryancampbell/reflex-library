package reflex.skins.tableSkins
{
	import flash.display.Sprite;
	
	import reflex.collections.SimpleCollection;
	import reflex.skins.Skin;
	import reflex.text.Label;
	
	public class SectionHeaderSkin extends Skin
	{
		
		[Bindable]
		public var label:Label;
		
		public function SectionHeaderSkin()
		{
			super();
			
			label = new Label();
			label.fontFamily = "Helvetica";
			label.fontSize = 12;
			label.bold = true;
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
				target.graphics.beginFill( 0xCCCCCC );
				target.graphics.drawRoundRect( 0, 0, width, height, 5, 5 );
				target.graphics.endFill();
			}
		}
	}
}