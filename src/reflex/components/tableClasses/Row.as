package reflex.components.tableClasses
{
	import reflex.binding.Bind;
	import reflex.binding.DataChange;
	import reflex.components.tableInterfaces.IRow;
	import reflex.components.tableInterfaces.ITable;
	import reflex.skins.tableSkins.RowSkin;
	
	[DefaultProperty( "cells" )]
	public class Row extends TableComponent implements IRow
	{
		
		private var _data:Object;
		private var _cells:Array;
		
		[Bindable(event="dataChange")]
		public function get data():Object { return _data; }
		public function set data(value:Object):void {
			DataChange.change( this, "data", _data, _data = value );
		}
		
		[Bindable(event="cellsChange")]
		[ArrayElementType( "reflex.components.tableInterfaces.ICell" )]
		public function get cells():Array { return _cells; }
		public function set cells( value:Array ):void {
			DataChange.change( this, "cells", _cells, _cells = value );
		}
		
		public function Row( data:Object = null, cells:Array = null, table:ITable = null )
		{
			super();
			
			this.table = table;
			this.data = data;
			this.cells = cells;
			
			skin = new RowSkin();
			
			Bind.addBinding(this, "skin.content", this, "cells");
		}
		
	}
}