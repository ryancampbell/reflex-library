package reflex.skins.tableSkins
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import reflex.components.tableInterfaces.ITableDisplayProvider;
	import reflex.skins.TableSkin;
	
	public class TableDisplayProvider extends EventDispatcher implements ITableDisplayProvider
	{
		
		public var sectionSkin:Class = SectionSkin;
		public var sectionHeaderSkin:Class = SectionHeaderSkin;
		public var tableSkin:Class = TableSkin;
		public var tableHeaderSkin:Class = TableHeaderSkin;
		public var columnHeaderSkin:Class = TableHeaderCellSkin;
		public var rowSkin:Class = RowSkin;
		public var cellSkin:Class = CellSkin;
		
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
			return new columnHeaderSkin();
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