package reflex.components.tableInterfaces
{
	import reflex.measurement.IMeasurable;

	public interface IColumn extends ICellDataProvider, IMeasurable
	{
		
		function get label():String;
		function set label(value:String):void;
		
		function get icon():Class;
		function set icon(value:Class):void;
		
		function get cells():Array;
		function set cells(value:Array):void;
		
		function get sumFunction():Function;
		function set sumFunction(value:Function):void;
		
		function get index():int;
		function set index(value:int):void;
		
		function get selected():Boolean;
		function set selected(value:Boolean):void;
		
		function get cellSkin():Class;
		function set cellSkin(value:Class):void;
		
	}
}