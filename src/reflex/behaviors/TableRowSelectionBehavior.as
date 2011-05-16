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
	import reflex.components.tableInterfaces.IRow;
	import reflex.components.tableInterfaces.ISection;
	
	public class TableRowSelectionBehavior extends Behavior
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
		
		public function TableRowSelectionBehavior(target:IEventDispatcher=null)
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
			row.addEventListener( MouseEvent.CLICK, rowClickHandler, false, 0, true );
		}
		
		public function resetSelection():void
		{
			var rows:IList = selection.selectedRows;
			var l:int = rows.length;
			
			for ( var i:int = 0; i < l; i++ )
			{
				var row:IRow = IRow( rows.getItemAt( i ) );
				
				if ( row.selected )
				{
					row.selected = false;
				
					for each ( var cell:ICell in row.cells ) {
						cell.selected = false;
					}
				}
			}
			
			selection.selectedItems.removeAll();
			selection.selectedItem = null;
			
			selection.selectedRows.removeAll();
			selection.selectedRow = null;
		}
		
		public function selectRow( row:IRow, reset:Boolean = false ):void
		{
			if ( reset )
				resetSelection();
			
			selection.selectedRows.addItem( row );
			
			if ( selection.selectedRows.length == 1 )
				selection.selectedRow = row;
			
			selection.selectedItems.addItem( row.data );
			
			if ( selection.selectedItems.length == 1 )
				selection.selectedItem = row.data;
			
			row.selected = true;
			
			for each ( var cell:ICell in row.cells ) {
				cell.selected = true;
			}
		}
		
		protected function rowClickHandler( event:MouseEvent ):void
		{
			selectRow( IRow( event.currentTarget ), ! event.ctrlKey );
		}
	}
}