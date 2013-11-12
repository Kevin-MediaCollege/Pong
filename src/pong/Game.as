package pong {
	import flash.events.Event;
	import pong.input.KeyManager;
	import pong.input.Key;
	import pong.media.SoundManager;
	/**
	 * @author Kevin Krol
	 */
	public class Game {
		public static var main:Main;
		
		public function Game(main:Main) {
			Game.main = main;
			
			KeyManager.initialize(main.stage);
			SoundManager.initialize();
		}
		
		public function update(e:Event):void {
			
		}
		
		public function dispose():void {
			KeyManager.dispose();
			SoundManager.dispose();
			
			Game.main = null;
		}
	}
}