package reflex.components.tableInterfaces
{
	import reflex.components.tableClasses.ITableSelection;

	public interface ITable
	{
		
		function get dataProvider():ITableDataProvider;
		function set dataProvider(value:ITableDataProvider):void;
		
		function get displayProvider():ITableDisplayProvider;
		function set displayProvider(value:ITableDisplayProvider):void;
		
		function get selection():ITableSelection;
		function set selection(value:ITableSelection):void;
		
		function get columns():Array;
		function set columns(value:Array):void;
		
		function get content():Array;
		function set content(value:Array):void;
		
	}
}