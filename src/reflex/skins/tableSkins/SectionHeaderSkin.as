package reflex.skins.tableSkins
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import reflex.collections.SimpleCollection;
	import reflex.containers.Container;
	import reflex.layouts.BasicLayout;
	import reflex.layouts.VerticalLayout;
	import reflex.skins.Skin;
	import reflex.text.Label;
	
	public class SectionHeaderSkin extends Skin
	{
		
		[Bindable]
		public var label:Label;
		
		public function SectionHeaderSkin()
		{
			super();
			
			layout = new BasicLayout();
			
			label = new Label();
			
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
			target.graphics.clear();
			target.graphics.beginFill( 0xCCCCCC );
			target.graphics.drawRoundRect( 0, 0, target.parent.parent.width, height, 5, 5 );
			target.graphics.endFill();
		}
	}
}