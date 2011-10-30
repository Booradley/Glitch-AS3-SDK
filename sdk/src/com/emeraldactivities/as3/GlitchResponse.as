package com.emeraldactivities.as3 
{
	import flash.events.Event;
	
	/**
	 * Glitch Response
	 * @author Bradley Adams
	 */
	public class GlitchResponse extends Event
	{
		private var _data:Object;
		
		public function GlitchResponse(type:String, bubbles:Boolean = false, cancelable:Boolean = false, data:Object = null) 
		{
			super(type, bubbles, cancelable);
			
   			_data = data;
		}
		
		override public function clone():Event
		{
			return new GlitchResponse(type, bubbles, cancelable, _data);
		}
		
		public function get data():Object
		{
			return _data;
		}
	}
}