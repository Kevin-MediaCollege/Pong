package pong.media {
	import flash.filesystem.File;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	/**
	 * SoundManager.as
	 * @since 30/10/2013
	 * @author Kevin Krol 
	 * @version 1.02
	 */
	public class SoundManager {
		private static var sounds:Dictionary;
		
		private static var initialized:Boolean;
		
		/**
		 * Initialize the audio manager
		 */
		public static function initialize():void {
			if(initialized) {
				return;
			}
			
			initialized = true;
			
			sounds = new Dictionary(true);
		}
		
		/**
		 * Import a sound
		 * @param label
		 * @param fileName
		 */
		public static function importSound(label:String, fileName:String):void {
			var file:File = File.applicationDirectory.resolvePath("sound/" + fileName);
			
			if(file.exists) {
				sounds[label] = new Sound(new URLRequest(file.nativePath));
			}
		}
		
		/**
		 * play a sound
		 * @param label
		 */
		public static function playSound(label:String):void {
			if (sounds[label] != undefined) {
				sounds[label].play();
			}
		}
		
		/**
		 * Dispose of the aduio manager
		 */
		public static function dispose():void {
			initialized = false;
			sounds = null;
		}
	}
}