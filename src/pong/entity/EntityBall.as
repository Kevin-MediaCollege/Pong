package pong.entity {
	import flash.display.Sprite;
	import pong.Main;
	import pong.obstacles.Obstacle;
	import pong.utils.geom.bounce;
	import pong.utils.geom.nextX;
	import pong.utils.geom.nextY;
	import pong.utils.math.Vector2;
	import pong.world.World;
	import pong.Game;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class EntityBall extends Entity {
		public static const BALL:int = 10;
		
		private var velX:Number = -3;
		private var velY:Number = -2;
		
		public function EntityBall() {
			super(BALL, new art_EntityBall());
			
			spr.x = Main.STAGE_WIDTH / 2;
			spr.y = Main.STAGE_HEIGHT / 2;
		}
		
		/** Ball update method */
		public override function update():void {
			for each(var p:EntityPlayer in World.players) {
				if (p.spr.hitTestObject(spr)) {
					if(velX != 0) {
						velX *= -1;
						velX = calcAngle(p.spr.y, spr.y);
					}
				}
			}
			
			for each(var o:Obstacle in World.obstacles) {
				if (o.spr.hitTestPoint(spr.x, spr.y, true)) {
					Game.restart();
				}
			}
			
			move();
		}
		
		protected override function move():void {
			spr.x += velX;
			spr.y += velY;
			
			if (spr.x <= (spr.width / 2)) {
				//TODO add score
			} else if (spr.x >= (Main.STAGE_WIDTH - (spr.width / 2))) {
				//TODO add score
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