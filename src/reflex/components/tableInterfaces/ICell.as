package reflex.components.tableInterfaces
{
	

	public interface ICell extends IRowContent
	{
		
		function get column():IColumn;
		function set column( value:IColumn ):void;
		
	}
}