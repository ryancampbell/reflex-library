package reflex.skins.tableSkins
{
	import flash.text.TextField;
	
	import reflex.collections.SimpleCollection;
	import reflex.components.Button;
	import reflex.skins.Skin;
	import reflex.text.Label;
	
	public class TableHeaderCellSkin extends Skin
	{
		
		public var label:Label;
		
		public function TableHeaderCellSkin()
		{
			super();
			
			label = new Label();
			label.color = 0xFFFFFF;
			content = new SimpleCollection([label]);
		}
	}
}