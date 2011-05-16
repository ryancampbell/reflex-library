package reflex.skins.tableSkins
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import reflex.binding.DataChange;
	import reflex.components.tableInterfaces.ITableDisplayProvider;
	import reflex.skins.TableSkin;
	
	public class TableDisplayProvider extends EventDispatcher implements ITableDisplayProvider
	{
	
		private var _columnGap:Number = 0;
		private var _rowGap:Number = 0;
		private var _rowPadding:Number = 0;
		
		public var sectionSkin:Class = SectionSkin;
		public var sectionHeaderSkin:Class = SectionHeaderSkin;
		public var tableSkin:Class = TableSkin;
		public var tableHeaderSkin:Class = TableHeaderSkin;
		public var tableHeaderCellSkin:Class = TableHeaderCellSkin;
		public var tableFooterSkin:Class = TableHeaderSkin;
		public var tableFooterCellSkin:Class = TableHeaderCellSkin;
		public var rowSkin:Class = RowSkin;
		public var cellSkin:Class = CellSkin;
		
		[Bindable( "columnGapChange" )]
		public function get columnGap():Number { return _columnGap; }
		public function set columnGap( value:Number ):void {
			DataChange.change( this, "columnGap", _columnGap, _columnGap = value );
		}
		
		[Bindable( "rowGapChange" )]
		public function get rowGap():Number { return _rowGap; }
		public function set rowGap( value:Number ):void {
			DataChange.change( this, "rowGap", _rowGap, _rowGap = value );
		}
		
		[Bindable( "rowPaddingChange" )]
		public function get rowPadding():Number { return _rowPadding; }
		public function set rowPadding( value:Number ):void {
			DataChange.change( this, "rowPadding", _rowPadding, _rowPadding = value );
		}
		
		public function skinForSection( sectionIndex:int ):Object
		{
			return new sectionSkin();
		}
		
		public function skinForSectionHeader( sectionIndex:int ):Object
		{
			return new sectionHeaderSkin();
		}
		
		public function skinForTable():Object
		{
			return new tableSkin();
		}
		
		public function skinForTableHeader():Object
		{
			return new tableHeaderSkin();
		}
		
		public function skinForColumnHeader( columnIndex:int ):Object
		{
			return new tableHeaderCellSkin();
		}
		
		public function skinForTableFooter():Object
		{
			return new tableFooterSkin();
		}
		
		public function skinForColumnFooter( columnIndex:int ):Object
		{
			return new tableFooterCellSkin();
		}
		
		public function skinForRow( rowIndex:int, sectionIndex:int = 0 ):Object
		{
			return new rowSkin();
		}
		
		public function skinForCell( columnIndex:int, rowIndex:int = 0, sectionIndex:int = 0 ):Object
		{
			return new cellSkin();
		}
		
		public function heightForHeader():Number
		{
			return 50;
		}
		
		public function heightForSection( sectionIndex:int ):Number
		{
			return 50;
		}
		
		public function heightForRow( rowIndex:int, sectionIndex:int = 0 ):Number
		{
			return 50;
		}
		
		public function TableDisplayProvider()
		{
			super();
		}
	}
}