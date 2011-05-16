package reflex.skins.tableSkins
{
	import reflex.collections.SimpleCollection;
	import reflex.layouts.BasicLayout;
	import reflex.layouts.VerticalLayout;
	import reflex.skins.Skin;
	import reflex.text.Label;
	
	public class TableHeaderCellSkin extends Skin
	{
		
		[Bindable]
		public var label:Label;
		
		public function TableHeaderCellSkin()
		{
			super();
			
			layout = new BasicLayout();
			
			label = new Label();
			label.x = 2;
			label.fontFamily = "Helvetica";
			label.fontSize = 12;
			label.bold = true;
			label.padding = 5;
			
			content = new SimpleCollection([label]);
		}
	}
}