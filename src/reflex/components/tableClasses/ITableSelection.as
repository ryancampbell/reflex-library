package reflex.components.tableClasses
{
	import mx.collections.IList;
	
	import reflex.data.ISelection;

	public interface ITableSelection extends ISelection
	{
		function get selectedCells():IList;
		
		function get selectedCell():Object;
		function set selectedCell( value:Object ):void;
	}
}