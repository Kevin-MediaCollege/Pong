package pong {
	import flash.events.Event;
	import pong.input.KeyManager;
	import pong.input.Key;
	import pong.media.SoundManager;
	import pong.world.World;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 * @version 1.0
	 */
	public class Game {
		public static var main:Main;
		
		private var world:World;
		
		public function Game(main:Main) {
			Game.main = main;
			
			KeyManager.initialize(main.stage);
			SoundManager.initialize();
			
			world = new World();
		}
		
		public function update(e:Event):void {
			world.update();
		}
		
		public function dispose():void {
			KeyManager.dispose();
			SoundManager.dispose();
			
			Game.main = null;
		}
	}
}