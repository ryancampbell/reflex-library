package reflex.components
{
	import reflex.behaviors.TableBehavior;
	import reflex.binding.Bind;
	import reflex.binding.DataChange;
	import reflex.components.tableClasses.Column;
	import reflex.components.tableClasses.ITableSelection;
	import reflex.components.tableClasses.TableSelection;
	import reflex.components.tableInterfaces.ITable;
	import reflex.components.tableInterfaces.ITableDataProvider;
	import reflex.components.tableInterfaces.ITableDisplayProvider;
	import reflex.skins.tableSkins.TableDisplayProvider;
	
	/**
	 * DataGrid style component used to layout and display data in rows and columns
	 */
	[DefaultProperty( "content" )]
	public class Table extends Component implements ITable
	{
		
		private var _dataProvider:ITableDataProvider;
		private var _displayProvider:ITableDisplayProvider;
		private var _selection:ITableSelection;
		private var _columns:Array;
		private var _content:Array;
		
		/**
		 * Optional data provider used to dynamically generate sections, rows and cells
		 */
		[Bindable(event="dataProviderChange")]
		public function get dataProvider():ITableDataProvider { return _dataProvider; }
		public function set dataProvider(value:ITableDataProvider):void {
			DataChange.change(this, "dataProvider", _dataProvider, _dataProvider = value);
		}
		
		/**
		 * A ITableDisplayProvider implementation used to determine the skins and spacing for all table components
		 * @default reflex.skins.tableSkins.TableDisplayProvider
		 */
		[Bindable(event="displayProviderChange")]
		public function get displayProvider():ITableDisplayProvider { return _displayProvider; }
		public function set displayProvider(value:ITableDisplayProvider):void {
			DataChange.change(this, "displayProvider", _displayProvider, _displayProvider = value);
		}
		
		/**
		 * A ITableSection implementation containing the selected item(s), row(s) and cell(s)
		 */
		[Bindable(event="selectionChange")]
		public function get selection():ITableSelection { return _selection; }
		public function set selection(value:ITableSelection):void {
			DataChange.change(this, "selection", _selection, _selection = value);
		}
		
		/**
		 * Optional array of column definitions
		 */
		[Bindable(event="columnsChange")]
		[ArrayElementType( "reflex.components.tableClasses.Column" )]
		public function get columns():Array { return _columns; }
		public function set columns(value:Array):void {
			DataChange.change(this, "columns", _columns, _columns = value);
		}
		
		/**
		 * An array of sections and rows that you can populate manually or have your data provider populate for you
		 */
		[Bindable(event="contentChange")]
		[ArrayElementType( "reflex.components.tableInterfaces.ITableContent" )]
		public function get content():Array { return _content; }
		public function set content(value:Array):void {
			DataChange.change(this, "content", _content, _content = value);
		}
		
		/**
		 * Constructor. Initializes the default selection, display provider, behavior and skin.
		 */
		public function Table()
		{
			super();
			
			selection = new TableSelection();
			displayProvider = new TableDisplayProvider();
			behaviors.addItem(new TableBehavior(this));
			
			Bind.addBinding(this, "skin.container.content", this, "content");
		}
		
	}
}