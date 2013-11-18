package pong.entity {
	import flash.display.MovieClip;
	import pong.audio.AudioManager;
	import pong.Game;
	import pong.Main;
	import pong.obstacles.Obstacle;
	import flash.display.Sprite;
	import pong.world.World;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class EntityBall extends Entity {
		public static const BALLS:Vector.<Sprite> = new <Sprite> [new art_EntityBall(), new art_EntityBallIce(), new art_EntityBallStar()];
		
		public static const BALL:int = 10;
		
		public static var speedMultiplier:Number;
		
		private var velX:Number = -3;
		private var velY:Number = -2;
		
		public function EntityBall(skin:int) {
			super(BALL, BALLS[skin]);
			
			speedMultiplier = 0;
			
			spr.x = Main.STAGE_WIDTH / 2;
			spr.y = Main.STAGE_HEIGHT / 2;
		}
		
		/** Ball update method */
		public override function update():void {
			for each(var p:EntityPlayer in World.players) {
				if (p.spr.hitTestObject(spr)) {
					if(velX != 0) {
						velX *= -1 + speedMultiplier;
						velX = calcAngle(p.spr.y, spr.y);
					}
					
					AudioManager.playAudio("hit", 0, 0.1);
				}
			}
			
			for each(var o:Obstacle in World.obstacles) {
				if (o.spr.hitTestPoint(spr.x, spr.y, true)) {
					if(o.instakill) {
						Game.updateState(Game.STATE_END);
					} else {
						if(velY != 0) {
							velY *= -1 + speedMultiplier;
							velY = calcAngle(o.spr.y, spr.y);
						}
					}
				}
			}
			
			move();
		}
		
		private function move():void {
			spr.x += velX;
			spr.y += velY;
			
			if (spr.x <= (spr.width / 2)) {
				Game.updateState(Game.STATE_END);
			} else if (spr.x >= (Main.STAGE_WIDTH - (spr.width / 2))) {
				Game.updateState(Game.STATE_END);
			}
			
			if (spr.y <= (spr.height / 2)) {
				spr.y = spr.height / 2;
				velY *= -1;
			} else if (spr.y >= (Main.STAGE_HEIGHT - (spr.height / 2))) {
				spr.y = Main.STAGE_HEIGHT - (spr.height / 2);
				velY *= -1;
			}
		}
		
		/**
		 * Calculate the nwe angle
		 * @param y1
		 * @param y2
		 * @return the new angle
		 */
		private function calcAngle(y1:Number, y2:Number):Number {
			var _velY:Number = 5 * ((y2 - y1) / 25);
			
			return _velY;
		}
	}
}