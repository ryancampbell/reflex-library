package reflex.table.skins.box
{
	import reflex.skins.tableSkins.TableDisplayProvider;
	
	public class BoxDisplayProvider extends TableDisplayProvider
	{
		public function BoxDisplayProvider()
		{
			super();
			
			rowGap = 1;
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