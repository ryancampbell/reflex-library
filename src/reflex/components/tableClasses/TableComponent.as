package reflex.components.tableClasses
{
	import reflex.binding.DataChange;
	import reflex.components.Component;
	import reflex.components.tableInterfaces.ITable;
	
	public class TableComponent extends Component
	{
		
		private var _table:ITable;
		
		[Bindable(event="tableChange")]
		public function get table():ITable { return _table; }
		public function set table(value:ITable):void {
			DataChange.change(this, "table", _table, _table = value);
		}
		
		public function TableComponent( table:ITable = null )
		{
			super();
			
			this.table = table;
		}
	}
}