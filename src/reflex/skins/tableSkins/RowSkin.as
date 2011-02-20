package reflex.skins.tableSkins
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import reflex.layouts.HorizontalLayout;
	import reflex.skins.Skin;
	
	public class RowSkin extends Skin
	{
		public function RowSkin()
		{
			super();
			
			layout = new HorizontalLayout();
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
			target.graphics.clear();
			target.graphics.beginFill( 0xFFFFFF );
			target.graphics.lineStyle( 1, 0xCCCCCC );
			target.graphics.drawRoundRect( 0, 0, width, height, 5, 5 );
			target.graphics.endFill();
		}
	}
}