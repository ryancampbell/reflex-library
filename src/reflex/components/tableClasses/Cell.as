package reflex.components.tableClasses
{
	import reflex.binding.Bind;
	import reflex.binding.DataChange;
	import reflex.components.Component;
	import reflex.components.tableInterfaces.ICell;
	import reflex.components.tableInterfaces.IColumn;
	import reflex.components.tableInterfaces.IRow;
	import reflex.skins.tableSkins.CellSkin;
	
	[DefaultProperty( "skin" )]
	public class Cell extends Component implements ICell
	{
		
		private var _row:IRow;
		private var _column:IColumn;
		private var _label:String;
		private var _icon:Class;
		private var _selected:Boolean;
		
		[Bindable(event="rowChange")]
		public function get row():IRow { return _row; }
		public function set row(value:IRow):void {
			DataChange.change( this, "row", _row, _row = value );
		}
		
		[Bindable(event="columnChange")]
		public function get column():IColumn { return _column; }
		public function set column(value:IColumn):void {
			DataChange.change( this, "column", _column, _column = value );
		}
		
		[Bindable(event="labelChange")]
		[Inspectable(name="Label", type=String, defaultValue="Label")]
		public function get label():String { return _label; }
		public function set label(value:String):void {
			DataChange.change( this, "label", _label, _label = value );
		}
		
		[Bindable(event="iconChange")]
		public function get icon():Class { return _icon; }
		public function set icon(value:Class):void {
			DataChange.change( this, "icon", _icon, _icon = value );
		}
		
		[Bindable(event="selectedChange")]
		[Inspectable(name="Selected", type=Boolean, defaultValue=false)]
		public function get selected():Boolean {return _selected; }
		public function set selected(value:Boolean):void {
			DataChange.change(this, "selected", _selected, _selected = value);
		}
		
		public function Cell( row:IRow = null, column:IColumn = null, label:String = null, icon:Class = null )
		{
			super();
			
			this.row = row;
			this.column = column;
			this.label = label;
			this.icon = icon;
			
			skin = new CellSkin();
			
			Bind.addBinding(this, "skin.label.text", this, "label");
		}
		
	}
}