package com.emeraldactivities.as3 
{
	/**
	 * Glitch Request Delegate Interface
	 * 
	 * Implement this in the class that will be receiving 
	 * request information. Then pass into the call to get 
	 * a new request object
	 * 
	 * @author Bradley Adams
	 */
	public interface IGlitchRequestDelegate 
	{
		// Called when a request is completed. Check the method via request.method and response via request.response
		function glitchRequestFinished(response:GlitchResponse):void;
		
		// Called when a request fails
		function glitchRequestFailed(response:GlitchResponse):void;
	}
}