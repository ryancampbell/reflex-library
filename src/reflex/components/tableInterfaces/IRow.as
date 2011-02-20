package reflex.components.tableInterfaces
{
	import mx.collections.IList;

	public interface IRow extends ITableContent
	{
		
		function get data():Object;
		function set data(value:Object):void;
		
		function get cells():Array;
		function set cells(value:Array):void;
		
	}
}