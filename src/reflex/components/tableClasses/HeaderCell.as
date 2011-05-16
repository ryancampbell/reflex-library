package reflex.components.tableClasses
{
	import reflex.binding.Bind;
	import reflex.components.tableInterfaces.IColumn;
	import reflex.components.tableInterfaces.IRow;
	import reflex.skins.tableSkins.TableHeaderCellSkin;
	
	public class HeaderCell extends Cell
	{
		
		public function HeaderCell( row:IRow = null, column:IColumn = null, label:String = null, icon:Class = null )
		{
			super( row, column, label, icon );
			
			skin = new TableHeaderCellSkin();
			
			Bind.addBinding( this, "skin.label.text", this, "label" );
		}
	}
}