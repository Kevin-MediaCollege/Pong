package pong.obstacles {
	import flash.display.Sprite;
	import pong.Main;
	import pong.display.sAddChild;
	import pong.Game;
	import pong.display.sRemoveChild;
	import pong.world.World;
	
	/**
	 * @author Kevin Krol
	 * @since 15-11-2013
	 */
	public class Obstacle extends Sprite {
		public static const MINE:int = 0;
		
		public var obstacleID:int;
		public var spr:Sprite;
		
		public function Obstacle(obstacleID:int, spr:Sprite) {
			this.obstacleID = obstacleID;
			this.spr = spr;
			
			spr.x = Main.STAGE_WIDTH / 2;
			spr.y = Main.STAGE_HEIGHT + (spr.height * 2);
			
			sAddChild(spr, Game.main);
		}
		
		/**
		 * Obstacle update method
		 */
		public function update():void {
			spr.y--;
			
			if (spr.y < -(spr.height * 2)) {
				sRemoveChild(this, Game.main);
				World.obstacles.splice(World.obstacles.indexOf(this), 1);
			}
		}
	}
}