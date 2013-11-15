package pong.obstacles {
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.display.Sprite;
	import pong.world.World;
	
	/**
	 * @author Kevin Krol
	 * @since 14-11-2013
	 */
	public class ObstacleSpawner {
		public static const OBSTACLES:Vector.<Class> = new <Class> [art_ObstacleMine];
		
		private var timer:Timer;
		
		public function ObstacleSpawner() {
			timer = new Timer(10000);
			timer.addEventListener(TimerEvent.TIMER, spawnObstacle);
			timer.start();
		}
		
		/**
		 * Spawn an obstacle
		 * @param e
		 */
		private function spawnObstacle(e:TimerEvent):void {
			var o:int = Math.floor(Math.random() * OBSTACLES.length);
			
			World.obstacles.push(new Obstacle(o, new OBSTACLES[o]()));
			
			if(timer.delay > 4500) {
				timer.delay -= 100;
			}
		}
	}
}