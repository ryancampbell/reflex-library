package reflex.components.tableClasses
{
	import reflex.components.tableInterfaces.IDataProvider;

	public class DataProvider implements IDataProvider
	{
		
		public var dataField:String;
		public var dataFunction:Function;
		public var compareFunction:Function;
		
		public function DataProvider( dataField:String = null, dataFunction:Function = null, compareFunction:Function = null )
		{
			this.dataField = dataField;
			this.dataFunction = dataFunction;
			this.compareFunction = compareFunction;
		}
		
		public function dataForItem( item:Object ):*
		{
			if ( dataFunction != null )
				return dataFunction( item );
			else if ( dataField != null && item is Object && Object( item ).hasOwnProperty( dataField ) )
				return item[ dataField ];
			else
				return item;
		}
		
		public function compareDataForItems( itemA:Object, itemB:Object ):int
		{
			return compareFunction( dataForItem( itemA ), dataForItem( itemB ) );
		}
	}
}