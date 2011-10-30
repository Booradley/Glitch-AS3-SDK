package com.emeraldactivities.as3 
{
	/**
	 * Glitch Constants
	 * @author Bradley Adams
	 */
	public class Constants 
	{
		public static const GLITCH_API_URL:String = 'http://api.glitch.com/simple/';
		public static const GLITCH_DOMAIN:String = '*.glitch.com';
		
		public function Constants() 
		{
			throw new Error('Please reference Glitch Constants with Constants.CONSTANT');
		}
	}
}