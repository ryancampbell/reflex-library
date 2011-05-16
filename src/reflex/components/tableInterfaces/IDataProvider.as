package reflex.components.tableInterfaces
{
	public interface IDataProvider
	{
		function dataForItem( item:Object ):*;
		
		function labelForItem( item:Object ):String;
		
		function compareDataForItems( itemA:Object, itemB:Object ):int;
	}
}