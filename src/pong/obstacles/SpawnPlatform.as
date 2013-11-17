package pong.obstacles {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * @author pepi
	 */
	public class SpawnPlatform extends Sprite {
		private var platforms:Array = new Array();
		private var posX:Number = 0;
		private var spawnDelay:Timer = new Timer(1000 + (5000 * Math.random()), 1);
		
		/**
		 * @param xp x position of each item
		 * @param yp y position of each item
		 * @param l amount of platforms to be spawned
		 */
		public function SpawnPlatform(xp:int = 50):void {
			spawnDelay.start();
			
			posX = xp;
			
			spawnDelay.addEventListener(TimerEvent.TIMER, platformSpawn);
			addEventListener(Event.ENTER_FRAME, loop);
		}

		private function loop(e:Event):void {
			for (var i:int = 0; i < platforms.length; i++) {
				platforms[i].y -= 10;
			}
		}
		
		public function platformSpawn(e:TimerEvent):void {
			platforms.push(new Platform());
				
			platforms[platforms.length - 1].x = posX + ((stage.stageWidth - (2 * posX)) * Math.random()); //posX + (50 * Math.random()) + (52 * i)
			platforms[platforms.length - 1].y = stage.stageHeight + platforms[platforms.length - 1].height;
				
			addChild(platforms[platforms.length - 1]);
			
			spawnDelay.delay = 1000 + (5000 * Math.random());
			spawnDelay.reset();
			spawnDelay.start();
		}
	}
}