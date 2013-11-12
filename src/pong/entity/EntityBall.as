package pong.entity {
	import pong.physics.Physics;
	import pong.world.World;
	import pong.Main;
	import pong.utils.math.Vector2;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class EntityBall extends Entity {
		public static const BALL:int = 10;
		
		private var isColliding:Boolean;
		
		public function EntityBall() {
			super(BALL, new art_EntityBall());
			
			mc.x = Main.STAGE_WIDTH / 2;
			mc.y = Main.STAGE_HEIGHT / 2;
		}
		
		/** Ball update method */
		public override function update():void {
			checkForCollision();
			
			trace(isColliding);
		}
		
		private function checkForCollision():void {
			isColliding = false;
			
			for each(var p:EntityPlayer in World.players) {
				var hitPoints:Vector.<Vector2> = new Vector.<Vector2>();
				
				hitPoints.push(new Vector2((p.mc.x + p.mc.width) / 2, p.mc.y));
				hitPoints.push(new Vector2((p.mc.x + p.mc.width) / 2, (p.mc.y + p.mc.height) / 2));
				hitPoints.push(new Vector2((p.mc.x + p.mc.width) / 2, (p.mc.y + p.mc.height)));
				
				const l:int = hitPoints.length;
				
				for (var i:int = 0; i < l; i++) {
					if (Physics.isColliding(new Vector2(mc.x, mc.y), hitPoints[i], mc.width * 2)) {
						isColliding = true;
					}
				}
			}
		}
	}
}