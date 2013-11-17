package pong.audio {
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
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
		public static function importAudio(label:String, fileName:String, playOnLoad:Boolean = false, loopAmt:int = 0, volume:Number = 1):void {
			var sound:Sound = new Sound();
			
			sound.addEventListener(Event.COMPLETE, onComplete);
			
			sound.load(new URLRequest("sound/" + fileName));
			
			function onComplete(e:Event):void {
				sound.removeEventListener(Event.COMPLETE, onComplete);
				
				audio[label] = sound;
				
				if (playOnLoad) {
					playAudio(label, loopAmt, volume);
				}
			}
		}
		
		/**
		 * Play audio
		 * @param label
		 */
		public static function playAudio(label:String, loopAmt:int = 0, volume:Number = 1):void {
			if (audio[label] != undefined) {
				var channel:SoundChannel;
				var transform:SoundTransform = new SoundTransform();
				
				transform.volume = volume;
				
				channel = audio[label].play(0, loopAmt);
				channel.soundTransform = transform;
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