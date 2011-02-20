package reflex.components.tableClasses
{
	import mx.collections.IList;
	
	import reflex.binding.Bind;
	import reflex.binding.DataChange;
	import reflex.components.Component;
	import reflex.components.tableInterfaces.ISection;
	import reflex.components.tableInterfaces.ITable;
	import reflex.skins.tableSkins.SectionSkin;
	
	[DefaultProperty( "rows" )]
	public class Section extends TableComponent implements ISection
	{
		
		private var _label:String;
		private var _icon:Class;
		private var _rows:Array;
		
		[Bindable(event="labelChange")]
		public function get label():String { return _label; }
		public function set label(value:String):void {
			DataChange.change( this, "label", _label, _label = value );
		}
		
		[Bindable(event="iconChange")]
		public function get icon():Class { return _icon; }
		public function set icon(value:Class):void {
			DataChange.change( this, "icon", _icon, _icon = value );
		}
		
		[Bindable(event="rowsChange")]
		[ArrayElementType( "reflex.components.tableClasses.TableComponent" )]
		public function get rows():Array { return _rows; }
		public function set rows(value:Array):void {
			DataChange.change(this, "rows", _rows, _rows = value);
		}
		
		public function Section( rows:Array = null, table:ITable = null )
		{
			super();
			
			this.table = table;
			this.rows = rows;
			
			skin = new SectionSkin();
			
			Bind.addBinding(this, "skin.header.skin.label.text", this, "label");
			Bind.addBinding(this, "skin.container.content", this, "rows");
		}
	}
}