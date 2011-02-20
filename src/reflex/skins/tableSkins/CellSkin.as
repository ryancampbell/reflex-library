package reflex.skins.tableSkins
{	
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
			content = new SimpleCollection([label]);
		}
	}
}