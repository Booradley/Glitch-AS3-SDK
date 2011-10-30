package com.emeraldactivities.glitch.sample
{
	import com.emeraldactivities.as3.Glitch;
	import com.emeraldactivities.as3.GlitchResponse;
	import com.emeraldactivities.as3.IGlitchRequestDelegate;
	import flash.text.TextField;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * Glitch AS3 Sample Application
	 * @author Bradley Adams
	 */
	public class Main extends Sprite implements IGlitchRequestDelegate
	{
		private var _glitch:Glitch;
		private var _feedback:TextField;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_feedback = new TextField();
			_feedback.width = 400;
			_feedback.height = 400;
			this.addChild(_feedback);
			
			this.log('Initializing Glitch API...');
			
			/**
			 * Access token should be obtained by the developer before instantiating this
			 * To get assistance with retrieving an access token, please follow the authentication tutorial
			 * at http://developer.glitch.com/docs/auth/
			 * 
			 * This example exposes the access token to the app through the Flashvars
			 */
			var accessToken:String = this.loaderInfo.parameters.access_token;
			
			_glitch = new Glitch(accessToken, this);
			_glitch.makeRequest('players.fullInfo', {
				'player_tsid': 'PUV99QHSN8D2ERD'
			});
			
			this.log('Getting players.fullInfo...');
		}
		
		public function glitchRequestFinished(response:GlitchResponse):void
		{
			this.log('ok: ' + response.data.ok);
			this.log('name: ' + response.data.player_name);
		}
		
		public function glitchRequestFailed(response:GlitchResponse):void
		{
			this.log('ok: ' + response.data.ok);
			this.log('error: ' + response.data.error);
		}
		
		private function log(str:String):void
		{
			_feedback.appendText(str + '\n');
		}
	}
}