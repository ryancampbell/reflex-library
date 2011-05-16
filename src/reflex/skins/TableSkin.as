package reflex.skins
{
	import flash.display.Sprite;
	
	import reflex.collections.SimpleCollection;
	import reflex.components.tableClasses.Footer;
	import reflex.components.tableClasses.Header;
	import reflex.containers.Container;

	public class TableSkin extends Skin
	{
		[Bindable]
		public var header:Header;
		
		[Bindable]
		public var container:Container;
		
		[Bindable]
		public var footer:Footer;
		
		public function TableSkin()
		{
			super();
			
			header = new Header();
			container = new Container();
			footer = new Footer();
			content = new SimpleCollection([header, container, footer]);
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
				/*target.graphics.clear();
				
				target.graphics.lineStyle( 1, 0xCCCCCC );
				target.graphics.moveTo( 0, height );
				target.graphics.lineTo( 0, 0 );
				target.graphics.lineTo( width, 0 );
				
				target.graphics.lineStyle( 1, 0x000000 );
				target.graphics.lineTo( width, height );
				target.graphics.lineTo( 0, height );*/
				
				/*target.graphics.lineStyle( 1, 0xBBBBBB );
				target.graphics.beginFill( 0xFFFFFF );
				target.graphics.drawRect( 0, 0, width, height );
				target.graphics.endFill();*/
			}
		}
	}
}