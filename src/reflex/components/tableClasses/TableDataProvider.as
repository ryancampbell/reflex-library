package reflex.components.tableClasses
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.collections.IList;
	import mx.events.CollectionEvent;
	
	import reflex.binding.Bind;
	import reflex.binding.DataChange;
	import reflex.components.tableInterfaces.ITableDataProvider;
	
	[Event(type="flash.events.Event", name="dataChange")]
	[DefaultProperty( "dataProvider" )]
	public class TableDataProvider extends EventDispatcher implements ITableDataProvider
	{
				
		private var _dataProvider:IList;
		
		public function get dataProvider():IList { return _dataProvider; }
		public function set dataProvider( value:IList ):void {
			if ( _dataProvider )
				_dataProvider.removeEventListener( CollectionEvent.COLLECTION_CHANGE, dataProvider_collectionChangeHandler );
			
			DataChange.change( this, "dataProvider", _dataProvider, _dataProvider = value );
			
			if ( _dataProvider )
				_dataProvider.addEventListener( CollectionEvent.COLLECTION_CHANGE, dataProvider_collectionChangeHandler );
		}
		
		public function TableDataProvider()
		{
			super();
		}
		
		public function get numberOfSections():int
		{
			return dataProvider && dataProvider.length ? 1 : 0;
		}
		
		public function numberOfRows(sectionIndex:int=0):int
		{
			return dataProvider ? dataProvider.length : 0;
		}
		
		public function dataForRow(rowIndex:int, sectionIndex:int=0):Object
		{
			return dataProvider ? dataProvider.getItemAt( rowIndex ) : null;
		}
		
		protected function dataProvider_collectionChangeHandler( event:CollectionEvent ):void
		{
			dispatchEvent( new Event( "dataChange" ) );
		}
	}
}