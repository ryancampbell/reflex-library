package reflex.behaviors
{
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import reflex.binding.DataChange;
	
	public class ExpandBehavior extends Behavior
	{
		
		private var _expanded:Boolean = true;
		
		[Bindable(event="expandedChange")]
		[Binding(target="target.expanded")]
		public function get expanded():Boolean { return _expanded; }
		public function set expanded(value:Boolean):void {
			DataChange.change(this, "expanded", _expanded, _expanded = value);
		}
		
		public function ExpandBehavior(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		[EventListener(type="click", target="target.skin.header.skin.expandButton")]
		public function expandButtonClickHandler(event:MouseEvent):void {
			expanded = ! expanded;
		}
	}
}