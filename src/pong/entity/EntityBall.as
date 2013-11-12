package pong.entity {
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class EntityBall extends Entity {
		public static const BALL:int = 10;
		
		public function EntityBall() {
			super(BALL, new art_EntityBall());
			
			mc.x = 50;
			mc.y = 50;
		}
	}
}