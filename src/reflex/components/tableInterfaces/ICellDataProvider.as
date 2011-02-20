package reflex.components.tableInterfaces
{
	public interface ICellDataProvider
	{
		
		/**
		 * 
		 */
		function iconForItem( item:Object ):Class;
		
		/**
		 * 
		 */
		function labelForItem( item:Object ):String;
		
	}
}