package reflex.table.skins.cocoa
{
	import reflex.skins.tableSkins.TableDisplayProvider;
	
	public class CocoaDisplayProvider extends TableDisplayProvider
	{
		public function CocoaDisplayProvider()
		{
			super();
			
			rowGap = 10;
			tableHeaderSkin = HeaderSkin;
			tableHeaderCellSkin = HeaderCellSkin;
			tableFooterSkin = FooterSkin;
			tableFooterCellSkin = HeaderCellSkin;
			rowSkin = RowSkin;
			cellSkin = CellSkin;
			sectionSkin = SectionSkin;
			sectionHeaderSkin = SectionHeaderSkin;
			tableSkin = TableSkin;
		}
	}
}