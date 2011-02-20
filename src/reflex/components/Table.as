package reflex.components
{
	import mx.collections.IList;
	
	import reflex.binding.Bind;
	import reflex.binding.DataChange;
	import reflex.components.tableClasses.Column;
	import reflex.components.tableClasses.Header;
	import reflex.components.tableClasses.ITableSelection;
	import reflex.skins.tableSkins.TableDisplayProvider;
	import reflex.components.tableInterfaces.ITableDataProvider;
	import reflex.components.tableInterfaces.ITableDisplayProvider;
	import reflex.data.IPosition;
	import reflex.data.ISelection;
	import reflex.layouts.ILayout;
	import reflex.skins.TableSkin;
	
	[DefaultProperty( "content" )]
	public class Table extends Component
	{
		
		private var _dataProvider:ITableDataProvider;
		private var _displayProvider:ITableDisplayProvider;
		private var _selection:ITableSelection;
		private var _columns:Array
		private var _content:Array;
		
		[Bindable(event="dataProviderChange")]
		public function get dataProvider():ITableDataProvider { return _dataProvider; }
		public function set dataProvider(value:ITableDataProvider):void {
			DataChange.change(this, "dataProvider", _dataProvider, _dataProvider = value);
		}
		
		[Bindable(event="displayProviderChange")]
		public function get displayProvider():ITableDisplayProvider { return _displayProvider; }
		public function set displayProvider(value:ITableDisplayProvider):void {
			DataChange.change(this, "displayProvider", _displayProvider, _displayProvider = value);
		}
		
		[Bindable(event="selectionChange")]
		public function get selection():ITableSelection { return _selection; }
		public function set selection(value:ITableSelection):void {
			DataChange.change(this, "selection", _selection, _selection = value);
		}
		
		[Bindable(event="columnsChange")]
		[ArrayElementType( "reflex.components.tableClasses.Column" )]
		public function get columns():Array { return _columns; }
		public function set columns(value:Array):void {
			DataChange.change(this, "columns", _columns, _columns = value);
		}
		
		[Bindable(event="contentChange")]
		[ArrayElementType( "reflex.components.tableInterfaces.ITableContent" )]
		public function get content():Array { return _content; }
		public function set content(value:Array):void {
			DataChange.change(this, "content", _content, _content = value);
		}
		
		public function Table()
		{
			super();
			
			displayProvider = new TableDisplayProvider();
			skin = displayProvider.skinForTable();
			
			Bind.addBinding(this, "skin.header.skin.container.content", this, "columns");
			Bind.addBinding(this, "skin.container.content", this, "content");
		}
		
	}
}