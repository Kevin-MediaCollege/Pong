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
		
		private var hitPoints:Vector.<Vector2>;
		private var bounced:Boolean;
		private var angle:int;
		
		public function EntityBall() {
			super(BALL, new art_EntityBall());
			
			spr.x = Main.STAGE_WIDTH / 2;
			spr.y = Main.STAGE_HEIGHT / 2;
			angle = 45;
		}
		
		/** Ball update method */
		public override function update():void {
			const collider:Sprite = getBoxCollider();
			
			if (!collider || bounced) {
				bounced = false;
				
				spr.x = nextX(spr.x, angle, MOVE_SPEED); 
				spr.y = nextY(spr.y, angle, MOVE_SPEED); 
			} else {
				checkForCollision(collider);
			}
		}
		
		/**
		 * Initialize hit points
		 */
		private function updateHitPoints():int {
			if(!hitPoints) {
				hitPoints = new Vector.<Vector2>();
			}
			
			hitPoints.splice(0, hitPoints.length);
			
			hitPoints.push(new Vector2(spr.x + (spr.width / 2), spr.y));
			hitPoints.push(new Vector2(spr.x + (spr.width / 2) / 1.5, spr.y + (spr.height / 2) / 1.5));
			
			hitPoints.push(new Vector2(spr.x, spr.y + (spr.height / 2)));
			hitPoints.push(new Vector2(spr.x - (spr.width / 2) / 1.5, spr.y + (spr.height / 2) / 1.5));
				
			hitPoints.push(new Vector2(spr.x - (spr.width / 2), spr.y));
			hitPoints.push(new Vector2(spr.x - (spr.width / 2) / 1.5, spr.y - (spr.height / 2) / 1.5));	
			
			hitPoints.push(new Vector2(spr.x, spr.y - (spr.height / 2)));
			hitPoints.push(new Vector2(spr.x + (spr.width / 2) / 1.5, spr.y - (spr.height / 2) / 1.5));
			
			return hitPoints.length;
		}
		
		/**
		 * Check for collision
		 * @param collider
		 */
		private function checkForCollision(collider:Sprite):void {
			const l:int = updateHitPoints();
			
			for (var i:int = 0; i < l; i++) {
				if (isPointColliding(hitPoints[i], collider)) {
					angle = bounce(angle, i * 45);
					bounced = true;
					break;
				}
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