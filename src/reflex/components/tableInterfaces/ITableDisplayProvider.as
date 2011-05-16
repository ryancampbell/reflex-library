package reflex.components.tableInterfaces
{
	public interface ITableDisplayProvider
	{
		
		function get columnGap():Number;
		
		function get rowGap():Number;
		
		function get rowPadding():Number;
		
		function skinForSection( sectionIndex:int ):Object;
		
		function skinForSectionHeader( sectionIndex:int ):Object;
		
		function skinForTable():Object;
		
		function skinForTableHeader():Object;
		
		function skinForColumnHeader( columnIndex:int ):Object;
		
		function skinForTableFooter():Object;
		
		function skinForColumnFooter( columnIndex:int ):Object;
		
		function skinForRow( rowIndex:int, sectionIndex:int = 0 ):Object;
		
		function skinForCell( columnIndex:int, rowIndex:int = 0, sectionIndex:int = 0 ):Object;
		
		function heightForHeader():Number;
		
		function heightForSection( sectionIndex:int ):Number;
		
		function heightForRow( rowIndex:int, sectionIndex:int = 0 ):Number;
		
	}
}