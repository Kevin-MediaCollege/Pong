package pong.entity {
	import flash.display.MovieClip;
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
		
		private var bounced:Boolean;
		private var angle:Number;
		
		public function EntityBall() {
			super(BALL, new art_EntityBall());
			
			mc.x = Main.STAGE_WIDTH / 2;
			mc.y = Main.STAGE_HEIGHT / 2;
			angle = 45;
		}
		
		/** Ball update method */
		public override function update():void {
			const collider:MovieClip = getBoxCollider();
			
			if (!collider || bounced) {
				bounced = false;
				
				mc.x = nextX(mc.x, angle, MOVE_SPEED); 
				mc.y = nextY(mc.y, angle, MOVE_SPEED); 
			} else {
				checkForCollision(collider);
			}
		}
		
		private function checkForCollision(collider:MovieClip):void {
			var points:Array = [
				new Vector2(mc.x + (mc.width / 2), mc.y),
				new Vector2(mc.x + (mc.width / 2) / 1.5, mc.y + (mc.height / 2) / 1.5),
				
				new Vector2(mc.x, mc.y + (mc.height / 2)),
				new Vector2(mc.x - (mc.width / 2) / 1.5, mc.y + (mc.height / 2) / 1.5),
				
				new Vector2(mc.x - (mc.width / 2), mc.y),
				new Vector2(mc.x - (mc.width / 2) / 1.5, mc.y - (mc.height / 2) / 1.5),
				
				new Vector2(mc.x, mc.y - (mc.height / 2)),
				new Vector2(mc.x + (mc.width / 2) / 1.5, mc.y - (mc.height / 2) / 1.5),
			];
			
			const l:int = points.length;
			
			for (var i:int = 0; i < l; i++) {
				if (isPointColliding(points[i], collider)) {
					angle = bounce(angle, i * 45);
					bounced = true;
					break;
				}
			}
		}
		
		private function getBoxCollider():MovieClip {
			for each(var p:EntityPlayer in World.players) {
				if (p.mc.hitTestObject(mc)) {
					return p.mc;
				}
			}
			
			return null;
		}
		
		private function isPointColliding(point:Vector2, mc:MovieClip):Boolean {
			if(mc) {
				if (mc.hitTestPoint(point.getX(), point.getY(), true)) {
					return true;
				}
			}
				
			return false;
		}
	}
}