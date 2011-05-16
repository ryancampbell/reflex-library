package reflex.components.tableInterfaces
{
	import flash.events.IEventDispatcher;
	
	import reflex.measurement.IMeasurable;
	

	public interface ICell extends IRowContent, IMeasurable, IEventDispatcher
	{
		
		function get column():IColumn;
		function set column( value:IColumn ):void;
		
		function get index():int;
		function set index(value:int):void;
		
		function get selected():Boolean;
		function set selected(value:Boolean):void;
		
	}
}