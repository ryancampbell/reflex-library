package com.theflashblog.util3d
{
	import flash.display.DisplayObject;                     
	
	/**
	 * @author Ralph Hauwert / UnitZeroOne
	 */
	public class SimpleZSortVO
	{
		public var object : DisplayObject;
		public var screenZ:Number;
		
		public function SimpleZSortVO(object : DisplayObject, screenZ:Number){
			this.object = object;
			this.screenZ = screenZ;
		}
	}
}