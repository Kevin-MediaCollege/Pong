package pong.entity {
	import flash.display.Sprite;
	import pong.Main;
	import pong.utils.geom.bounce;
	import pong.utils.geom.nextX;
	import pong.utils.geom.nextY;
	import pong.utils.math.Vector2;
	import pong.world.World;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class EntityBall extends Entity {
		public static const MOVE_SPEED:int = 5;
		public static const BALL:int = 10;
		
		private var bounceCooldown:int;
		private var bounced:Boolean;
		private var angle:int;
		
		public function EntityBall() {
			super(BALL, new art_EntityBall());
			
			spr.x = Main.STAGE_WIDTH / 2;
			spr.y = Main.STAGE_HEIGHT / 2;
			angle = 20;
		}
		
		/** Ball update method */
		public override function update():void {
			angle %= 360;
			
			const collider:Sprite = getBoxCollider();
			
			if (!collider || bounced) {
				if(bounceCooldown <= 0) {
					bounced = false;
				}
				
				spr.x = nextX(spr.x, angle, MOVE_SPEED); 
				spr.y = nextY(spr.y, angle, MOVE_SPEED); 
			} else {
				if(bounceCooldown <= 0) {
					checkForCollision(collider);
				}
			}
			
			if(bounceCooldown > 0) {
				bounceCooldown--;
			}
		}
		
		/**
		 * Check for collision
		 * @param collider
		 */
		private function checkForCollision(collider:Sprite):void {
			for (var a:int = 0; a < 360; a++) {
				if (isPointColliding(new Vector2(nextX(spr.x, a, MOVE_SPEED), nextY(spr.y, a, MOVE_SPEED)), collider)) {
					angle = bounce(angle, a * 45);
					bounced = true;
					bounceCooldown = 4;
					break;
				}
			}
			
			if (!bounced) {
				spr.x = nextX(spr.x, angle, MOVE_SPEED); 
				spr.y = nextY(spr.y, angle, MOVE_SPEED); 
			}
		}
		
		/**
		 * Check if the specified x and y are colliding with the movieclip
		 * @param point
		 * @param spr
		 * @return true if the x and y are colliding with the movieclip
		 */
		private function isPointColliding(point:Vector2, spr:Sprite):Boolean {
			if(spr) {
				if (spr.hitTestPoint(point.getX(), point.getY(), true)) {
					return true;
				}
			}
				
			return false;
		}
		
		/**
		 * @return the collider's movieclip
		 */
		private function getBoxCollider():Sprite {
			for each(var p:EntityPlayer in World.players) {
				if (p.spr.hitTestObject(spr)) {
					return p.spr;
				}
			}
			
			return null;
		}
	}
}