package reflex.components.tableClasses
{
	import reflex.behaviors.ButtonBehavior;
	import reflex.binding.Bind;
	import reflex.binding.DataChange;
	import reflex.components.tableInterfaces.IRow;
	import reflex.components.tableInterfaces.ITable;
	
	[DefaultProperty( "cells" )]
	public class Row extends TableComponent implements IRow
	{
		
		private var _data:Object;
		private var _cells:Array;
		private var _index:int = -1;
		private var _selected:Boolean = false;
		
		[Bindable(event="dataChange")]
		public function get data():Object { return _data; }
		public function set data(value:Object):void {
			if ( ! ( value is IRow ) )
				DataChange.change( this, "data", _data, _data = value );
		}
		
		[Bindable(event="cellsChange")]
		[ArrayElementType( "reflex.components.tableInterfaces.ICell" )]
		public function get cells():Array { return _cells; }
		public function set cells( value:Array ):void {
			DataChange.change( this, "cells", _cells, _cells = value );
		}
		
		[Bindable(event="indexChange")]
		public function get index():int { return _index; }
		public function set index(value:int):void {
			DataChange.change( this, "index", _index, _index = value );
		}
		
		[Bindable(event="selectedChange")]
		[Inspectable(name="Selected", type=Boolean, defaultValue=false)]
		public function get selected():Boolean { return _selected; }
		public function set selected( value:Boolean ):void {
			DataChange.change( this, "selected", _selected, _selected = value );
		}
		
		public function Row( data:Object = null, cells:Array = null, table:ITable = null, index:int = -1, selected:Boolean = false )
		{
			super();
			
			this.table = table;
			this.data = data;
			this.cells = cells;
			this.index = index;
			this.selected = selected;
			
			behaviors.addItem(new ButtonBehavior(this));
			
			Bind.addBinding(this, "skin.container.content", this, "cells");
			Bind.addBinding(this, "skin.currentState", this, "currentState");
		}
		
	}
}