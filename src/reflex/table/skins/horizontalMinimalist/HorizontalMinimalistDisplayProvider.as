package reflex.table.skins.horizontalMinimalist
{
	import reflex.skins.tableSkins.TableDisplayProvider;
	
	public class HorizontalMinimalistDisplayProvider extends TableDisplayProvider
	{
		public function HorizontalMinimalistDisplayProvider()
		{
			super();
			
			tableHeaderSkin = HeaderSkin;
			tableHeaderCellSkin = HeaderCellSkin;
			tableFooterSkin = FooterSkin;
			tableFooterCellSkin = HeaderCellSkin;
			rowSkin = RowSkin;
			cellSkin = CellSkin;
			sectionSkin = SectionSkin;
			sectionHeaderSkin = SectionHeaderSkin;
		}
	}
}