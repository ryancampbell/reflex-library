package reflex.skins.tableSkins
{
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.osmf.display.ScaleMode;
	
	import reflex.collections.SimpleCollection;
	import reflex.containers.Container;
	import reflex.skins.Skin;
	
	public class RowSkin extends Skin
	{
		
		[Bindable]
		public var container:Container;
		
		public function RowSkin()
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
			var index:int = target.parent ? target.parent.getChildIndex( target ) : 0;
			var bgColor:uint = index % 2 == 0 ? 0xFFCC00 : 0x00CCFF; 
			
			if ( width > 0 && height > 0 )
			{
				target.graphics.clear();
				target.graphics.beginFill( bgColor, .2 );
				target.graphics.lineStyle( 1, 0xCCCCCC, 1, true, ScaleMode.NONE, CapsStyle.ROUND, JointStyle.ROUND );
				target.graphics.drawRoundRect( 0, 0, width, height, 5, 5 );
				target.graphics.endFill();
			}
		}
	}
}