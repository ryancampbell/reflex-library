package reflex.behaviors
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import reflex.binding.DataChange;
	import reflex.components.tableClasses.Cell;
	import reflex.components.tableClasses.Column;
	import reflex.components.tableClasses.FooterCell;
	import reflex.components.tableClasses.HeaderCell;
	import reflex.components.tableClasses.Row;
	import reflex.components.tableClasses.Section;
	import reflex.components.tableInterfaces.IColumn;
	import reflex.components.tableInterfaces.IRow;
	import reflex.components.tableInterfaces.ITable;
	import reflex.components.tableInterfaces.ITableDataProvider;
	import reflex.components.tableInterfaces.ITableDisplayProvider;
	import reflex.layouts.BasicLayout;
	import reflex.layouts.ILayout;
	import reflex.layouts.TableLayout;
	
	/**
	 * Populates content if data provider exists
	 * Adds any missing column definitions
	 * Initializes skins from display provider
	 * Wires up table layout to all table related components
	 */
	public class TableBehavior extends Behavior
	{
		
		private var _content:Array;
		private var _dataProvider:ITableDataProvider;
		private var _displayProvider:ITableDisplayProvider;
		private var _skin:Object;
		private var _columns:Array;
		
		protected var tableLayout:ILayout;
		protected var basicLayout:ILayout;
		
		[Bindable(event="dataProviderChange")]
		[Binding(target="target.dataProvider")]
		public function get dataProvider():ITableDataProvider { return _dataProvider; }
		public function set dataProvider(value:ITableDataProvider):void {
			DataChange.change(this, "dataProvider", _dataProvider, _dataProvider = value);
		}
		
		[Bindable(event="displayProviderChange")]
		[Binding(target="target.displayProvider")]
		public function get displayProvider():ITableDisplayProvider { return _displayProvider; }
		public function set displayProvider(value:ITableDisplayProvider):void {
			DataChange.change(this, "displayProvider", _displayProvider, _displayProvider = value);
		}
		
		[Bindable(event="contentChange")]
		[Binding(target="target.content")]
		public function get content():Array { return _content; }
		public function set content( value:Array ):void {
			DataChange.change( this, "content", _content, _content = value );
		}
		
		[Bindable(event="skinChange")]
		[Binding(target="target.skin")]
		public function get skin():Object { return _skin; }
		public function set skin( value:Object ):void {
			DataChange.change( this, "skin", _skin, _skin = value );
		}
		
		[Bindable(event="columnsChange")]
		[Binding(target="target.columns")]
		[ArrayElementType( "reflex.components.tableClasses.Column" )]
		public function get columns():Array { return _columns; }
		public function set columns(value:Array):void {
			DataChange.change(this, "columns", _columns, _columns = value);
		}
		
		public function TableBehavior(target:IEventDispatcher=null)
		{
			super(target);
			
			tableLayout = new TableLayout( ITable( target ) );
			basicLayout = new BasicLayout();
		}
		
		[EventListener(type="dataChange",target="target.dataProvider")]
		[EventListener(type="dataProviderChange",target="target.dataProvider")]
		[EventListener(type="dataProviderChange",target="target")]
		public function onDataChange(event:Event):void
		{
			resetContent();
		}
		
		[EventListener(type="contentChange",target="target")]
		public function onContentChange(event:Event):void
		{
			initContent();
		}
		
		/**
		 * Called when the data provider changes to reset the all the sections, rows, cells based on dynamic data
		 */
		protected function resetContent():void {
			clearColumnCells();
			
			if ( dataProvider && dataProvider.numberOfSections > 0 )
				content = getSections();
			
			initTableSkin();
			initHeader();
			initFooter();
		}
		
		/**
		 * Called when the content changes to initize the sections, rows and cells. Only executed if a data provider doesn't exist
		 */
		protected function initContent():void {
			if ( dataProvider != null )
				return; // nothing to do since resetContent() did all the initializing
			
			clearColumnCells();
			
			var l:int = content.length;
			
			for ( var i:int = 0; i < l; i++ ) {
				var child:Object = content[i];
				
				if ( child is Row )
					initRow( Row( child ), i, 0 );
				else if ( child is Section )
					initSection( Section( child ), i );
			}
			
			initTableSkin();
			initHeader();
			initFooter();
		}
		
		protected function initTableSkin():void {
			skin = displayProvider.skinForTable();
			skin.layout = tableLayout;
			skin.container.layout = tableLayout;
		}
		
		protected function initHeader():void {
			if ( skin.header ) {
				skin.header.cells = getHeaderCells();
				skin.header.skin = displayProvider.skinForTableHeader();
				skin.header.skin.layout = tableLayout;
				skin.header.skin.container.layout = tableLayout;
			}
		}
		
		protected function initFooter():void {
			if ( skin.footer ) {
				skin.footer.cells = getFooterCells();
				skin.footer.skin = displayProvider.skinForTableFooter();
				skin.footer.skin.layout = tableLayout;
				skin.footer.skin.container.layout = tableLayout;
			}
		}
		
		protected function clearColumnCells():void {
			if ( columns ) {
				var l:int = columns.length;
				
				for ( var i:int = 0; i < l; i++ ) {
					var column:IColumn = IColumn( columns[i] );
					
					column.cells = [];
					column.index = i;
				}
			} else {
				columns = [];
			}
		}
		
		protected function getHeaderCells():Array {
			if ( columns == null || columns.length == 0 )
				return [];
			
			var cells:Array = [];
			var l:int = columns.length;
			
			for ( var i:int = 0; i < l; i++ ) {
				var column:IColumn = columnForCellIndex( i );
				var cell:HeaderCell = new HeaderCell( IRow( skin.header ), column, column.label, column.icon );
				
				cell.index = i;
				cell.skin = displayProvider.skinForColumnHeader(i);
				
				if ( cell.skin.layout == null )
					cell.skin.layout = basicLayout;
				
				column.cells[ column.cells.length ] = cell;
				cells[i] = cell;
			}
			
			return cells;
		}
		
		protected function getFooterCells():Array {
			if ( columns == null || columns.length == 0 )
				return [];
			
			var cells:Array = [];
			var l:int = columns.length;
			
			for ( var i:int = 0; i < l; i++ ) {
				var column:IColumn = columnForCellIndex( i );
				var label:String = column.sumFunction != null ? column.sumFunction( column ) : null;
				var cell:FooterCell = new FooterCell( IRow( skin.footer ), column, label, column.icon );
				
				cell.index = i;
				cell.skin = displayProvider.skinForColumnFooter(i);
				
				if ( cell.skin.layout == null )
					cell.skin.layout = basicLayout;
				
				cell.skin.layout = tableLayout;
				column.cells[ column.cells.length ] = cell;
				cells[i] = cell;
			}
			
			return cells;
		}
		
		protected function getSections():Array {
			var sections:Array = [];
			var l:int = dataProvider.numberOfSections;
			
			for ( var i:int = 0; i < l; i++ ) {
				var section:Section = new Section( getRowsForSection( i ), ITable( target ) );
			
				initSectionSkin( section, i );
				
				sections[ i ] = section;
			}
			
			return sections;
		}
		
		protected function initSection( section:Section, sectionIndex:int ):void {
			for ( var i:int = 0; i < section.rows.length; i++ ) {
				var row:Row = Row( section.rows[i] );
				
				initRow( row, i, sectionIndex );
			}
			
			initSectionSkin( section, sectionIndex );
		}
		
		protected function initSectionSkin( section:Section, sectionIndex:int ):void {
			section.skin = displayProvider.skinForSection( sectionIndex );
			section.skin.layout = tableLayout;
			section.skin.container.layout = tableLayout;
			section.skin.header.skin = displayProvider.skinForSectionHeader( sectionIndex );
			section.skin.header.skin.layout = basicLayout;
		}
		
		protected function getRowsForSection( sectionIndex:int ):Array {
			var rows:Array = [];
			var l:int = dataProvider.numberOfRows( sectionIndex );
			
			for ( var i:int = 0; i < l; i++ ) {
				var row:Row = new Row( dataProvider.dataForRow( i, sectionIndex ), null, ITable( target ), i );
				
				row.cells = getCellsForRow( row, i, sectionIndex );
				
				initRowSkin( row, i, sectionIndex );
				
				rows[ i ] = row;
			}
			
			return rows;
		}
		
		protected function initRow( row:Row, rowIndex:int, sectionIndex:int ):void {
			row.index = rowIndex;
			
			var l:int = row.cells.length;
			
			for ( var i:int = 0; i < l; i++ ) {
				var cell:Cell = Cell( row.cells[i] );
				
				cell.row = row;
				
				initCell( cell, i, rowIndex, sectionIndex );
			}
			
			initRowSkin( row, rowIndex, sectionIndex );
		}
		
		protected function initRowSkin( row:Row, rowIndex:int, sectionIndex:int ):void {
			row.skin = displayProvider.skinForRow( rowIndex, sectionIndex );
			row.skin.layout = tableLayout;
			row.skin.container.layout = tableLayout;
		}
		
		protected function getCellsForRow( row:IRow, rowIndex:int, sectionIndex:int ):Array {
			var cells:Array = [];
			var l:int = columns.length;
			
			for ( var i:int = 0; i < l; i++ )
			{
				var column:IColumn = columnForCellIndex( i );
				var cell:Cell = new Cell( row, column, column.labelForItem( row.data ), column.iconForItem( row.data ), i );
				
				initCellSkin( cell, i, rowIndex, sectionIndex );
				
				column.cells[ column.cells.length ] = cell;
				cells[ i ] = cell; 
			}
			
			return cells;
		}
		
		protected function initCell( cell:Cell, cellIndex:int, rowIndex:int, sectionIndex:int ):void {
			var column:IColumn = columnForCellIndex( cellIndex );
			
			cell.column = column;
			cell.index = cellIndex;
			
			initCellSkin( cell, cellIndex, rowIndex, sectionIndex );
			
			column.cells[ column.cells.length ] = cell;
		}
		
		protected function initCellSkin( cell:Cell, cellIndex:int, rowIndex:int, sectionIndex:int ):void {
			if ( cell.column.cellSkin )
				cell.skin = new cell.column.cellSkin();
			else
				cell.skin = displayProvider.skinForCell( cellIndex, rowIndex, sectionIndex );
			
			if ( cell.skin.layout == null )
				cell.skin.layout = basicLayout;
		}
		
		protected function columnForCellIndex( cellIndex:int ):IColumn {
			if ( columns.length > cellIndex )
				return IColumn( columns[ cellIndex ] );
			else
				return columns[ cellIndex ] = new Column( cellIndex );
		}
	}
}