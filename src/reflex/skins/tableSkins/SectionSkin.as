package reflex.skins.tableSkins
{
	import reflex.collections.SimpleCollection;
	import reflex.components.Component;
	import reflex.components.tableClasses.Header;
	import reflex.containers.Container;
	import reflex.skins.Skin;
	
	public class SectionSkin extends Skin
	{
		
		[Bindable]
		public var header:Header;
		
		[Bindable]
		public var container:Container;
		
		public function SectionSkin()
		{
			super();
			
			header = new Header();
			header.skin = new SectionHeaderSkin();
			container = new Container();
			content = new SimpleCollection([header, container]);
		}
	}
}