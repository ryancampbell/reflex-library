package reflex.components.tableInterfaces
{
	import flash.events.IEventDispatcher;
	
	import mx.core.IDataRenderer;
	
	import reflex.measurement.IMeasurable;

	public interface IRow extends ITableContent, IMeasurable, IDataRenderer, IEventDispatcher
	{
		
		function get cells():Array;
		function set cells(value:Array):void;
		
		function get index():int;
		function set index(value:int):void;
		
		function get selected():Boolean;
		function set selected(value:Boolean):void;
		
	}
}