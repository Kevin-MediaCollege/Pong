package pong.world {
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.display.Sprite;
	import pong.world.World;
	
	/**
	 * @author Kevin Krol
	 * @since 17-11-2013
	 */
	public class WorldAmbientSpawner {
		public static const AMBIENT:Vector.<Class> = new <Class> [art_AmbientFish1, art_AmbientFish2, art_AmbientFish3];
		
		private var timer:Timer;
		
		public function WorldAmbientSpawner() {
			timer = new Timer(200);
			timer.addEventListener(TimerEvent.TIMER, spawnAmbient);
			timer.start();
		}
		
		/**
		 * Spawn an ambient entity
		 * @param e
		 */
		private function spawnAmbient(e:TimerEvent):void {
			var a:int = Math.floor(Math.random() * AMBIENT.length);
			
			World.ambient.push(new WorldAmbient(new AMBIENT[a]()));
		}
	}
}