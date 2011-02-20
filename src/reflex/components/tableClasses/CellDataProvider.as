package reflex.components.tableClasses
{
	import flash.events.EventDispatcher;
	
	import reflex.binding.DataChange;
	import reflex.components.Component;
	import reflex.components.tableInterfaces.ICellDataProvider;
	import reflex.components.tableInterfaces.IDataProvider;

	public class CellDataProvider extends Component implements ICellDataProvider
	{
		
		private var _iconProvider:IDataProvider;
		private var _labelProvider:IDataProvider;
		
		[Bindable(event="iconProviderChange")]
		public function get iconProvider():IDataProvider { return _iconProvider; }
		public function set iconProvider(value:IDataProvider):void {
			DataChange.change( this, "icon", _iconProvider, _iconProvider = value );
		}
		
		[Bindable(event="labelProviderChange")]
		public function get labelProvider():IDataProvider { return _labelProvider; }
		public function set labelProvider(value:IDataProvider):void {
			DataChange.change( this, "label", _labelProvider, _labelProvider = value );
		}
		
		public function CellDataProvider( labelProvider:IDataProvider = null, iconProvider:IDataProvider = null )
		{
			super();
			
			this.labelProvider = labelProvider;
			this.iconProvider = iconProvider;
			
			this.labelProvider ||= new DataProvider( "label" );
			this.iconProvider ||= new DataProvider( "icon" );
		}
		
		public function iconForItem( item:Object ):Class
		{
			return iconProvider ? iconProvider.dataForItem( item ) as Class : null;
		}
		
		public function labelForItem( item:Object ):String
		{
			return labelProvider ? String( labelProvider.dataForItem( item ) ) : "";
		}
	}
}