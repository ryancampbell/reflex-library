package reflex.skins
{
	import reflex.collections.SimpleCollection;
	import reflex.components.Component;
	import reflex.containers.Container;
	import reflex.layouts.VerticalLayout;
	import reflex.skins.tableSkins.TableHeaderSkin;

	public class TableSkin extends Skin
	{
		
		[Bindable]
		public var container:Container;
		
		[Bindable]
		public var header:Component;
		
		public function TableSkin()
		{
			super();
			
			layout = new VerticalLayout();
			
			header = new Component();
			header.skin = new TableHeaderSkin();
			
			container = new Container();
			container.layout = new VerticalLayout();
			
			content = new SimpleCollection([header, container]);
		}
	}
}