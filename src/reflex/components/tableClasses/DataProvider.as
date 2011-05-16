package reflex.components.tableClasses
{
	import reflex.components.tableInterfaces.IDataProvider;

	public class DataProvider implements IDataProvider
	{
		
		public var dataField:String;
		public var dataFunction:Function;
		public var labelFunction:Function;
		public var compareFunction:Function;
		
		public function DataProvider( dataField:String = null, dataFunction:Function = null, labelFunction:Function = null, compareFunction:Function = null )
		{
			this.dataField = dataField;
			this.dataFunction = dataFunction;
			this.labelFunction = labelFunction;
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
		
		public function labelForItem( item:Object ):String
		{
			if ( labelFunction != null )
				return labelFunction( dataForItem( item ) );
			else
				return String( dataForItem( item ) );
		}
		
		public function compareDataForItems( itemA:Object, itemB:Object ):int
		{
			return compareFunction != null ? compareFunction( dataForItem( itemA ), dataForItem( itemB ) ) : 0;
		}
	}
}