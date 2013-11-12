package pong {
	import flash.events.Event;
	import pong.input.KeyManager;
	import pong.input.Key;
	import pong.audio.AudioManager;
	import pong.world.World;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class Game {
		public static var main:Main;
		
		private var world:World;
		
		public function Game(main:Main) {
			Game.main = main;
			
			KeyManager.initialize(main.stage);
			AudioManager.initialize();
			
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
	}
}