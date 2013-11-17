package pong {
	import flash.events.Event;
	import pong.audio.AudioManager;
	import pong.input.KeyManager;
	import pong.world.World;

	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class Game {
		public static var main:Main;
		
		private static var world:World;
		
		public function Game(main:Main) {
			Game.main = main;
			
			KeyManager.initialize(main.stage);
			AudioManager.initialize();
			
			AudioManager.importAudio("hit", "Hit.mp3");
			AudioManager.importAudio("background", "Background.mp3", true, 9999, 0.1);
			
			world = new World();
		}
		
		public function update(e:Event):void {
			world.update();
		}
		
		public function dispose():void {
			KeyManager.dispose();
			AudioManager.dispose();
			
			Game.main = null;
		}
		
		public static function restart():void {
			world = new World();
		}
	}
}