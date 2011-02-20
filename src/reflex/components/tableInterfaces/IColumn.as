package reflex.components.tableInterfaces
{

	public interface IColumn extends ICellDataProvider
	{
		
		function get label():String;
		function set label(value:String):void;
		
		function get icon():Class;
		function set icon(value:Class):void;
		
	}
}