package reflex.behaviors
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import mx.collections.IList;
	
	import reflex.binding.DataChange;
	import reflex.components.tableClasses.ITableSelection;
	import reflex.components.tableInterfaces.ICell;
	import reflex.components.tableInterfaces.IColumn;
	import reflex.components.tableInterfaces.IRow;
	import reflex.components.tableInterfaces.ISection;
	
	public class TableCellSelectionBehavior extends Behavior
	{
		
		private var _selection:ITableSelection;
		private var _content:Array;
		
		[Bindable(event="selectionChange")]
		[Binding(target="target.selection")]
		public function get selection():ITableSelection { return _selection; }
		public function set selection( value:ITableSelection ):void {
			DataChange.change( this, "selection", _selection, _selection = value );
		}
		
		[Bindable(event="contentChange")]
		[Binding(target="target.content")]
		public function get content():Array { return _content; }
		public function set content( value:Array ):void {
			DataChange.change( this, "content", _content, _content = value );
		}
		
		public function TableCellSelectionBehavior(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		[DataListener(target="content")]
		public function resetContentListeners():void
		{
			for each ( var item:Object in content )
			{
				if ( item is ISection )
					addSection( ISection( item ) );
				else if ( item is IRow )
					addRow( IRow( item ) );
			}
		}
		
		public function addSection( section:ISection ):void
		{
			for each ( var row:IRow in section.rows )
			{
				addRow( row );
			}
		}
		
		public function addRow( row:IRow ):void
		{			
			for each ( var cell:ICell in row.cells )
			{
				addCell( cell );
			}
		}
		
		public function addCell( cell:ICell ):void
		{
			cell.addEventListener( MouseEvent.CLICK, cellClickHandler, false, 0, true );
		}
		
		public function resetSelection():void
		{
			var cells:IList = selection.selectedCells;
			
			for ( var i:int = 0; i < cells.length; i++ )
			{
				var cell:ICell = ICell( cells.getItemAt( i ) );
				
				cell.selected = false;
			}
			
			selection.selectedItems.removeAll();
			selection.selectedItem = null;
			
			selection.selectedCells.removeAll();
			selection.selectedCell = null;
		}
		
		public function selectColumn( column:IColumn, reset:Boolean = false ):void
		{
			if ( reset )
				resetSelection();
			
			for each ( var cell:ICell in column.cells )
			{
				selectCell( cell );
			}
		}
		
		public function selectCell( cell:ICell, reset:Boolean = false ):void
		{
			if ( reset )
				resetSelection();
			
			var data:Object = cell.column.labelProvider.dataForItem( cell.row.data );
			
			selection.selectedItems.addItem( data );
			
			if ( selection.selectedItems.length == 1 )
				selection.selectedItem = data;
			
			selection.selectedCells.addItem( cell );
			
			if ( selection.selectedCells.length == 1 )
				selection.selectedCell = cell;
			
			cell.selected = true;
		}
		
		protected function columnClickHandler( event:MouseEvent ):void
		{
			selectColumn( IColumn( event.currentTarget ) );
		}
		
		protected function cellClickHandler( event:MouseEvent ):void
		{
			selectCell( ICell( event.currentTarget ), ! event.ctrlKey );
		}
	}
}