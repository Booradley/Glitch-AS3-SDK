package com.emeraldactivities.as3 
{
	import com.adobe.serialization.json.JSON;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.system.Security;
	
	/**
	 * Glitch Request
	 * @author Bradley Adams
	 */
	public class GlitchRequest extends URLLoader
	{
		public static const SUCCESS:String = 'success';
		public static const FAILURE:String = 'failure';
		
		public function GlitchRequest(type:String, params:Object) 
		{
			Security.allowDomain(Constants.GLITCH_DOMAIN);
			
			var variables:URLVariables = new URLVariables();
			
			for (var param:String in params)
			{
				variables[param] = params[param];
			}
			
			var request:URLRequest = new URLRequest(Constants.GLITCH_API_URL + type);
			
			request.data = variables;
			request.method = URLRequestMethod.GET;
			
			this.dataFormat = URLLoaderDataFormat.TEXT;
			this.addEventListener(Event.COMPLETE, handleRequest);
			this.addEventListener(IOErrorEvent.IO_ERROR, handleFailure);
			this.load(request);
		}
		
		private function handleRequest(e:Event):void 
		{
			var response:Object = JSON.decode(URLLoader(e.currentTarget).data);
			
			if (!response.ok || response.error)
			{
				this.dispatchEvent(new GlitchResponse(FAILURE, false, false, response));
				return;
			}
			
			this.dispatchEvent(new GlitchResponse(SUCCESS, false, false, response));
		}
		
		private function handleFailure(e:IOErrorEvent):void 
		{
			var response:Object = JSON.decode(URLLoader(e.currentTarget).data);
			
			this.dispatchEvent(new GlitchResponse(FAILURE, false, false, response));
		}
	}
}