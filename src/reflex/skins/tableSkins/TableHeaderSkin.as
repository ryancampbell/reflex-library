package reflex.skins.tableSkins
{
	import flash.display.Sprite;
	
	import reflex.collections.SimpleCollection;
	import reflex.containers.Container;
	import reflex.layouts.BasicLayout;
	import reflex.layouts.HorizontalLayout;
	import reflex.skins.Skin;
	
	public class TableHeaderSkin extends Skin
	{
		
		[Bindable]
		public var container:Container;
		
		public function TableHeaderSkin()
		{
			super();
			
			layout = new BasicLayout();
			
			container = new Container();
			container.layout = new HorizontalLayout();
			
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
			target.graphics.clear();
			target.graphics.beginFill( 0x333333 );
			target.graphics.drawRoundRect( 0, 0, width, height, 5, 5 );
			target.graphics.endFill();
		}
	}
}