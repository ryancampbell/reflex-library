package reflex.components.tableInterfaces
{
	public interface ICellDataProvider
	{
		
		function get labelProvider():IDataProvider;
		function set labelProvider( value:IDataProvider ):void;
		
		function get iconProvider():IDataProvider;
		function set iconProvider( value:IDataProvider ):void;
		
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