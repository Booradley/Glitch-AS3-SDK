package com.emeraldactivities.as3
{
	import com.emeraldactivities.as3.Constants;
	import flash.net.URLVariables;
	
	import flash.display.Sprite;
	import flash.net.navigateToURL;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * Glitch AS3 SDK
	 * @author Bradley Adams
	 */
	public class Glitch
	{
		private var _accessToken:String;
		private var _delegate:IGlitchRequestDelegate;
		
		public function Glitch(access_token:String, delegate:IGlitchRequestDelegate):void 
		{
			if (access_token == null)
			{
				throw new ArgumentError('Please specify your Access Token when initializing the Glitch AS3 API');
			}
			
			_accessToken = access_token;
			_delegate = delegate;
		}
		
		public function makeRequest(type:String, params:Object = null):void
		{
			params['oauth_token'] = _accessToken;
			
			var request:GlitchRequest = new GlitchRequest(type, params);
			
			request.addEventListener(GlitchRequest.SUCCESS, handleRequestSuccess);
			request.addEventListener(GlitchRequest.FAILURE, handleRequestFailure);
		}
		
		private function handleRequestSuccess(e:GlitchResponse):void 
		{
			_delegate.glitchRequestFinished(e);
		}
		
		private function handleRequestFailure(e:GlitchResponse):void 
		{
			_delegate.glitchRequestFailed(e);
		}
	}
}