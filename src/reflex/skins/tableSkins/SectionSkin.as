package reflex.skins.tableSkins
{
	import reflex.binding.Bind;
	import reflex.collections.SimpleCollection;
	import reflex.components.Component;
	import reflex.containers.Container;
	import reflex.layouts.VerticalLayout;
	import reflex.skins.Skin;
	
	public class SectionSkin extends Skin
	{
		
		[Bindable]
		public var header:Component;
		
		[Bindable]
		public var container:Container;
		
		public function SectionSkin()
		{
			super();
			
			layout = new VerticalLayout();
			
			header = new Component();
			header.skin = new SectionHeaderSkin();
			
			container = new Container();
			container.layout = new VerticalLayout();
			
			content = new SimpleCollection([header, container]);
		}
	}
}