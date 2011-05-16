package reflex.layouts
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import reflex.components.Component;
	import reflex.components.tableInterfaces.ICell;
	import reflex.components.tableInterfaces.IColumn;
	import reflex.components.tableInterfaces.IRow;
	import reflex.components.tableInterfaces.ISection;
	import reflex.components.tableInterfaces.ITable;
	import reflex.containers.Container;
	import reflex.measurement.resolveHeight;
	import reflex.measurement.resolveWidth;
	import reflex.measurement.setSize;
	
	public class TableLayout extends Layout implements ILayout
	{
		
		protected var table:ITable;
		
		public function TableLayout( table:ITable )
		{
			super();
			
			this.table = table;
		}
		
		override public function measure( children:Array ):Point
		{
			var point:Point = super.measure( children );
			var x:Number = 0;
			var y:Number = 0;
			var l:int = children ? children.length : 0;
			
			for ( var i:int = 0; i < l; i++ )
			{
				var child:Object = children[i];
				var width:Number = widthForObject( child );
				var height:Number = heightForObject( child );
				
				if ( !isNaN( x + width ) && x + width > point.x )
					point.x = x + width;
				if ( !isNaN( y + height ) && y + height > point.y )
					point.y = y + height;
				
				if ( child is ICell )
				{	
					x += width + table.displayProvider.columnGap;
				}
				else if ( child is IRow )
				{					
					y += height;
					
					//if ( !(child is Header) && !( child is Footer) )
						y += table.displayProvider.rowGap;
				}
				else if ( child is ISection )
				{
					y += height +  table.displayProvider.rowGap;
				}
				else if ( child is Container )
				{
					if ( child.parent is ITable || child.parent is ISection )
					{
						y += height;
						y +=  table.displayProvider.rowGap;
					}
					else if ( child.parent is IRow )
					{
						x +=  table.displayProvider.rowPadding;
						y +=  table.displayProvider.rowPadding;
					}
				}
			}
			
			if ( point.x == 0 )
				point.x = NaN;
			if ( point.y == 0 )
				point.y = NaN;
			
			return point;
		}
		
		override public function update( children:Array, rectangle:Rectangle ):void
		{
			super.update( children, rectangle );
			
			var x:Number = 0;
			var y:Number = 0;
			var l:int = children ? children.length : 0;
			
			for ( var i:int = 0; i < l; i++ )
			{
				var child:Object = children[i];
				var width:Number = widthForObject( child );
				var height:Number = heightForObject( child );
				
				if ( child is ICell )
				{
					child.x = x;
					x += width +  table.displayProvider.columnGap;
				}
				else if ( child is IRow )
				{					
					child.y = y;
					y += height;
					y +=  table.displayProvider.rowGap;
				}
				else if ( child is ISection )
				{
					child.y = y;
					y += height +  table.displayProvider.rowGap;
				}
				else if ( child is Container )
				{
					if ( child.parent is ITable || child.parent is ISection )
					{
						child.y = y;
						y += height;
						y +=  table.displayProvider.rowGap;
					}
					else if ( child.parent is IRow )
					{
						child.x =  table.displayProvider.rowPadding;
						child.y =  table.displayProvider.rowPadding;
					}
				}
				
				reflex.measurement.setSize(child, width, height);
			}
		}
		
		/**
		 * 
		 * @param object Object to measure
		 * @return Pixel width of object
		 */
		public function widthForObject( object:Object ):Number
		{
			if ( object is ICell )
				return widthForColumn( ICell( object ).column );
			else if ( object is IRow )
				return widthForColumns() + table.displayProvider.rowPadding * 2;
			else if ( object is ISection )
				return widthForColumns();
			else if ( object is ITable )
				return widthForColumns();
			else if ( object is Container ) {
				return widthForContainer( Container( object ) );
			} else
				return reflex.measurement.resolveWidth( object );
		}
		
		public function heightForObject( object:Object ):Number
		{
			if ( object is ICell )
				return heightForRow( ICell( object ).row );
			else if ( object is IRow )
				return heightForRow( IRow( object) ) + table.displayProvider.rowPadding * 2;
			else if ( object is ISection )
				return heightForSection( ISection( object ) );
			else if ( object is ITable )
				return heightForTable( ITable( object ) );
			else if ( object is Container ) {
				return heightForContainer( Container( object ) );
			} else
				return reflex.measurement.resolveHeight( object );
		}
		
		public function widthForContainer( container:Container ):Number
		{
			if ( container.parent is IRow || container.parent is ISection || container.parent is ITable )
				return widthForColumns();
			
			var width:Number = 0;
			var l:int = container.numChildren;
			
			for ( var i:int = 0; i < l; i++ )
			{
				var child:Object = container.getChildAt(i);
				var childWidth:Number = widthForObject( child );
				
				if ( childWidth > width )
					width = childWidth;
			}
			
			if ( width == 0 )
				width = NaN;
			
			return width;
		}
		
		public function heightForContainer( container:Container ):Number
		{
			if ( container.parent is IRow )
				return heightForRow( IRow( container.parent ) );
			
			var y:Number = 0;
			var height:Number = 0;
			var l:int = container.numChildren;
			
			for ( var i:int = 0; i < l; i++ )
			{
				var child:Object = container.getChildAt(i);
				var childHeight:Number = heightForObject( child );
				
				if ( y + childHeight > height )
					height = y + childHeight;
				
				if ( child is IRow )
				{					
					y += childHeight;
					y +=  table.displayProvider.rowGap;
				}
				else if ( child is ISection )
				{
					y += childHeight +  table.displayProvider.rowGap;
				}
				else if ( child is Container )
				{
					if ( child.parent is ITable || child.parent is ISection )
					{
						y += childHeight;
						y +=  table.displayProvider.rowGap;
					}
					else if ( child.parent is IRow )
					{
						y +=  table.displayProvider.rowPadding;
					}
				}
			}
			
			if ( height == 0 )
				height = NaN;
			
			return height;
		}
		
		public function widthForColumn( column:IColumn ):Number
		{
			if ( ! isNaN( column.explicit.width ) )
				return column.explicit.width;
			else if ( ! isNaN( column.measured.width ) && column.measured.width > 0 )
				return column.measured.width;
			else
				return column.measured.width = maxWidthForCells( column.cells );
		}
		
		public function heightForRows( rows:Array ):Number
		{
			var height:Number = 0;
			var l:int = rows.length;
			
			for ( var i:int = 0; i < l; i++ )
			{
				var row:IRow = IRow( rows[i] );
				
				height += heightForRow( row );
			}
			
			height +=  table.displayProvider.rowGap * l;
			height +=  table.displayProvider.rowPadding * 2 * l;
			
			return height;
		}
		
		public function heightForRow( row:IRow ):Number
		{
			if ( ! isNaN( row.explicit.height) )
				return row.explicit.height;
			else if ( ! isNaN( row.measured.height ) )
				return row.measured.height;
			else if ( row.cells )
				return maxHeightForCells( row.cells );
			else
				return reflex.measurement.resolveHeight( row );
		}
		
		public function widthForColumns():Number
		{
			var width:Number = 0;
			var l:int = table.columns.length;
			
			for ( var i:int = 0; i < l; i++ )
			{
				var column:IColumn = IColumn( table.columns[i] );
				
				width += widthForColumn( column );
			}
			
			width +=  table.displayProvider.columnGap * ( l - 1 );
			
			return width;
		}
		
		public function maxWidthForCells( cells:Array ):Number
		{
			var maxWidth:Number = 0;
			var l:int = cells.length;
			
			for ( var i:int = 0; i < l; i++ ) {
				var cell:ICell = ICell( cells[i] );
				var width:Number = reflex.measurement.resolveWidth( cell );
				
				if ( width > maxWidth )
					maxWidth = width;
			}
			
			return maxWidth;
		}
		
		public function maxHeightForCells( cells:Array ):Number
		{
			var maxHeight:Number = 0;
			var l:int = cells.length;
			
			for ( var i:int = 0; i < l; i++ ) {
				var cell:ICell = ICell( cells[i] );
				var height:Number = reflex.measurement.resolveHeight( cell );
				
				if ( height > maxHeight )
					maxHeight = height;
			}
			
			return maxHeight;
		}
		
		public function heightForTable( table:ITable ):Number
		{
			var height:Number = 0;
			
			height += heightForHeader( Component( table ) );
			height += heightForObject( Container( Component( table ).skin.container ) );
			height += heightForFooter( Component( table ) );
			
			return height;
		}
		
		/**
		 * 
		 */
		public function heightForSection( section:ISection ):Number
		{
			var height:Number = 0;
			
			height += heightForHeader( Component( section ) );
			height += heightForRows( section.rows );
			//height += heightForFooter( Component( section ) );
			
			return height;
		}
		
		/**
		 * Height for header
		 * 
		 * @param component
		 * @return
		 */
		public function heightForHeader( component:Component ):Number
		{
			return component.skin.hasOwnProperty( "header" ) && component.skin.header ? heightForObject( component.skin.header ) : 0;
		}
		
		/**
		 * Height for footer
		 * 
		 * @param component 
		 * @return
		 */
		public function heightForFooter( component:Component ):Number
		{
			return component.skin.hasOwnProperty( "footer" ) && component.skin.footer ? heightForObject( component.skin.footer ) : 0;
		}
	}
}