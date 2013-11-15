package pong.obstacles {
	/**
	 * @author pepi
	 */
	public class SpawnPlatform extends Platform {
		private var platforms:Array = new Array();
		
		/**
		 * @param xp x position of each item
		 * @param yp y position of each item
		 * @param l amount of platforms to be spawned
		 */
		public function SpawnPlatform(xp:int = 50, yp:int = 10, l:int = 10):void {
			platformSpawn(xp, yp, l);
			loopPlatform();
		}
		
		public function platformSpawn(posX:int, posY:int, length:int):void {
			for (var i:int = 0; i < length; i++) {
				platforms.push(new Platform());
				
				platforms[i].x = posX + ((50 * Math.random()) + 100) * i;
				platforms[i].y = posY;
				
				addChild(platforms[platforms.length - 1]);
			}
		}
		
		private function loopPlatform():void {
			
		}
	}
}