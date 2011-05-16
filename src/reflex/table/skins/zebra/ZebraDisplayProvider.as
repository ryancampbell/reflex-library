package reflex.table.skins.zebra
{
	import reflex.skins.tableSkins.TableDisplayProvider;
	
	public class ZebraDisplayProvider extends TableDisplayProvider
	{
		public function ZebraDisplayProvider()
		{
			super();
			
			columnGap = 1;
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