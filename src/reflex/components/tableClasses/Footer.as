package reflex.components.tableClasses
{
	import reflex.skins.tableSkins.TableHeaderSkin;
	
	public class Footer extends Row
	{
		
		public function Footer()
		{
			super();
			
			skin = new TableHeaderSkin();
		}
	}
}