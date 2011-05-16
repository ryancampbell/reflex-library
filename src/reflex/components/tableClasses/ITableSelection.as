package reflex.components.tableClasses
{
	import mx.collections.IList;
	
	import reflex.components.tableInterfaces.ICell;
	import reflex.components.tableInterfaces.IRow;
	import reflex.data.ISelection;

	public interface ITableSelection extends ISelection
	{
		function get selectedCells():IList;
		
		function get selectedCell():ICell;
		function set selectedCell( value:ICell ):void;
		
		function get selectedRows():IList;
		
		function get selectedRow():IRow;
		function set selectedRow( value:IRow ):void;
	}
}