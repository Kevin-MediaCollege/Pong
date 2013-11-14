package pong.obstacles {
	/**
	 * @author pepi
	 */
	public class SpawnPlatform extends Platform {
		private var platforms:Array = new Array();
		
		public function SpawnPlatform():void {
			platformSpawn();
		}
		
		public function platformSpawn():void {
			//var l:int = platforms.length;
			Draw();
			
			for (var i:int = 0; i < 10; i++) {
				platforms.push(wall);
				platforms.x = platforms.x + stage.stageWidth * Math.random();
			}
		}
	}
}