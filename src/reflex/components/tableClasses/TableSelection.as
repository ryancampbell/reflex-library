package reflex.components.tableClasses
{
	import mx.collections.IList;
	
	import reflex.binding.DataChange;
	import reflex.collections.SimpleCollection;
	import reflex.components.tableInterfaces.ICell;
	import reflex.components.tableInterfaces.IRow;
	import reflex.data.Selection;
	
	public class TableSelection extends Selection implements ITableSelection
	{
		
		private var _selectedCell:ICell;
		private var _selectedCells:IList;
		private var _selectedRow:IRow;
		private var _selectedRows:IList;
		
		public function TableSelection()
		{
			super();
			
			_selectedCells = new SimpleCollection([]);
			_selectedRows = new SimpleCollection([]);
		}
		
		[Bindable( "selectedCellsChange" )]
		public function get selectedCells():IList { return _selectedCells; }
		
		[Bindable( "selectedCellChange" )]
		public function get selectedCell():ICell { return _selectedCell; }
		public function set selectedCell(value:ICell):void {
			DataChange.change( this, "selectedCell", _selectedCell, _selectedCell = value );
		}
		
		[Bindable( "selectedRowsChange" )]
		public function get selectedRows():IList { return _selectedRows; }
		
		[Bindable( "selectedRowChange" )]
		public function get selectedRow():IRow { return _selectedRow; }
		public function set selectedRow(value:IRow):void {
			DataChange.change( this, "selectedRow", _selectedRow, _selectedRow = value );
		}
		
	}
}