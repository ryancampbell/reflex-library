package reflex.components.tableClasses
{
	import reflex.binding.Bind;
	import reflex.binding.DataChange;
	import reflex.components.tableInterfaces.IColumn;
	import reflex.components.tableInterfaces.IDataProvider;
	import reflex.skins.tableSkins.TableHeaderCellSkin;
	
	public class Column extends CellDataProvider implements IColumn
	{
		
		private var _index:int = -1;
		private var _selected:Boolean = false;
		private var _label:String;
		private var _icon:Class;
		private var _sumFunction:Function;
		private var _cells:Array;
		private var _cellSkin:Class;
		
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
		
		[Bindable(event="sumFunctionChange")]
		public function get sumFunction():Function { return _sumFunction; }
		public function set sumFunction(value:Function):void {
			DataChange.change( this, "sumFunction", _sumFunction, _sumFunction = value );
		}
		
		[Bindable(event="cellsChange")]
		public function get cells():Array { return _cells; }
		public function set cells(value:Array):void {
			DataChange.change( this, "cells", _cells, _cells = value );
		}
		
		[Bindable(event="cellSkinChange")]
		public function get cellSkin():Class { return _cellSkin; }
		public function set cellSkin(value:Class):void {
			DataChange.change( this, "cellSkin", _cellSkin, _cellSkin = value );
		}
		
		public function Column( index:int = 0, label:String = null, icon:Class = null, labelProvider:IDataProvider = null, iconProvider:IDataProvider = null )
		{
			super( labelProvider, iconProvider );
			
			this.index = index;
			this.label = label;
			this.icon = icon;
			
			skin = new TableHeaderCellSkin();
			
			Bind.addBinding(this, "skin.label.text", this, "label");
		}
		
		protected function defaultSumFunction( column:IColumn, items:Array ):String
		{
			var total:Number = 0;
			var l:int = items.length;
			
			for ( var i:int = 0; i < l; i++ )
			{
				var item:Object = items[ i ];
				var amount:Number = Number( column.labelProvider.dataForItem( item ) );
				
				total += amount;
			}
			
			return String( total );
		}
		
	}
}