package pong.audio {
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	/**
	 * @since 30/10/2013
	 * @author Kevin Krol 
	 */
	public class AudioManager {
		private static var audio:Dictionary;
		
		private static var initialized:Boolean;
		
		/**
		 * Initialize the Sound Manager
		 */
		public static function initialize():void {
			if(initialized) {
				return;
			}
			
			initialized = true;
			
			audio = new Dictionary(true);
		}
		
		/**
		 * Import an audio file
		 * @param label
		 * @param fileName
		 */
		public static function importAudio(label:String, fileName:String):void {
			var sound:Sound = new Sound();
			
			sound.addEventListener(Event.COMPLETE, onComplete);
			
			sound.load(new URLRequest("sound/" + fileName));
			
			function onComplete(e:Event):void {
				audio[label] = sound;
			}
		}
		
		/**
		 * Play audio
		 * @param label
		 */
		public static function playAudio(label:String):void {
			if (audio[label] != undefined) {
				audio[label].play();
			}
		}
		
		/**
		 * Dispose of the Sound Manager
		 */
		public static function dispose():void {
			initialized = false;
			audio = null;
		}
	}
}