package reflex.components.tableClasses
{
	import reflex.skins.tableSkins.TableHeaderSkin;
	
	public class Header extends Row
	{		
		public function Header()
		{
			super();
			
			skin = new TableHeaderSkin();
		}
	}
}