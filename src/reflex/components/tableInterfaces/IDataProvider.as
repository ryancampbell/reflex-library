package reflex.components.tableInterfaces
{
	public interface IDataProvider
	{
		function dataForItem( item:Object ):*;
		
		function compareDataForItems( itemA:Object, itemB:Object ):int;
	}
}