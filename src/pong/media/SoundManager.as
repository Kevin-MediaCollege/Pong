package pong.media {
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.events.IOErrorEvent;
	import flash.utils.Dictionary;
	
	/**
	 * SoundManager.as
	 * @since 30/10/2013
	 * @author Kevin Krol 
	 * @version 1.02 (flash)
	 */
	public class SoundManager {
		private static var sounds:Dictionary;
		
		private static var initialized:Boolean;
		
		/**
		 * Initialize the Sound Manager
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
			var sound:Sound = new Sound();
			
			sound.addEventListener(Event.COMPLETE, onComplete);
			
			sound.load(new URLRequest("sound/" + fileName));
			
			function onComplete(e:Event):void {
				sounds[label] = sound;
			}
		}
		
		/**
		 * Play a sound
		 * @param label
		 */
		public static function playSound(label:String):void {
			if (sounds[label] != undefined) {
				sounds[label].play();
			}
		}
		
		/**
		 * Dispose of the Sound Manager
		 */
		public static function dispose():void {
			initialized = false;
			sounds = null;
		}
	}
}