package reflex.components.tableInterfaces
{
	public interface ITableDataProvider
	{
		
		/**
		 * 
		 */
		function get numberOfSections():int;
		
		/**
		 * 
		 */
		function numberOfRows( sectionIndex:int = 0 ):int;
		
		/**
		 * 
		 */
		function dataForRow( rowIndex:int, sectionIndex:int = 0 ):Object;
		
	}
}