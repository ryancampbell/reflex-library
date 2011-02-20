package reflex.components.tableClasses
{
	import reflex.binding.Bind;
	import reflex.binding.DataChange;
	import reflex.components.tableInterfaces.IColumn;
	import reflex.components.tableInterfaces.IDataProvider;
	import reflex.skins.tableSkins.TableHeaderCellSkin;
	
	public class Column extends CellDataProvider implements IColumn
	{
		
		private var _label:String;
		private var _icon:Class;
		
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
		
		public function Column( label:String = null, icon:Class = null, labelProvider:IDataProvider = null, iconProvider:IDataProvider = null )
		{
			super( labelProvider, iconProvider );
			
			this.label = label;
			this.icon = icon;
			
			skin = new TableHeaderCellSkin();
			
			Bind.addBinding(this, "skin.label.text", this, "label");
		}
		
	}
}