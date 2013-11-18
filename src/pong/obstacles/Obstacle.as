package pong.obstacles {
	import flash.display.Sprite;
	import pong.display.sAddChild;
	import pong.display.sRemoveChild;
	import pong.Game;
	import pong.Main;
	import pong.world.World;
	
	/**
	 * @author Kevin Krol
	 * @since 15-11-2013
	 */
	public class Obstacle extends Sprite {
		public static const MINE:int = 0;
		public static const CORAL_1:int = 1;
		public static const CORAL_2:int = 2;
		public static const CORAL_3:int = 3;
		public static const CORAL_4:int = 4;
		
		public var obstacleID:int;
		public var spr:Sprite;
		
		public var instakill:Boolean;
		
		public function Obstacle(obstacleID:int, spr:Sprite) {
			this.obstacleID = obstacleID;
			this.spr = spr;
			
			switch(obstacleID) {
			case MINE:
				spr.x = Main.STAGE_WIDTH / 2;
				this.instakill = true;
				break;
			case CORAL_1:
				spr.x = (spr.width / 2) - 20;
				break;
			case CORAL_2:
				spr.x = Main.STAGE_WIDTH - (spr.width / 2);
				break;
			case CORAL_3:
				spr.x = Main.STAGE_WIDTH - (spr.width / 2);
				break;
			case CORAL_4:
				spr.x = Main.STAGE_WIDTH - (spr.width / 2);
				break;
			}
			
			spr.y = Main.STAGE_HEIGHT + (spr.height * 2);
			
			sAddChild(spr, Game.main);
		}
		
		/**
		 * Obstacle update method
		 */
		public function update():void {
			spr.y--;
			
			if (spr.y < -spr.height) {
				sRemoveChild(this, Game.main);
				World.obstacles.splice(World.obstacles.indexOf(this), 1);
			}
		}
	}
}