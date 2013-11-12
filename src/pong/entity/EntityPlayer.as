package pong.entity {
	import pong.Main;
	import pong.input.Key;
	import pong.input.KeyManager;
	import pong.utils.geom.Direction;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class EntityPlayer extends Entity {
		public static const PLAYER_1:int = 1;
		public static const PLAYER_2:int = 2;
		
		public static const MOVE_SPEED:int = 3;
		
		private var moveDirection:int;
		
		public function EntityPlayer(entityID:int) {
			super(entityID, new art_EntityPlayer());
			
			var keyUp:int;
			var keyDown:int;
			
			switch(entityID) {
			case PLAYER_1:
				keyUp = Key.W;
				keyDown = Key.S;
				mc.x = 0;
				break;
			case PLAYER_2:
				keyUp = Key.UP;
				keyDown = Key.DOWN;
				mc.x = Main.STAGE_WIDTH - mc.width;
				break;
			default:
				throw new Error("Entity ID is not supported");
			}
			
			mc.y = (Main.STAGE_HEIGHT / 2) - (mc.height / 2);
			
			KeyManager.addPressedFunction(keyUp, onUpPressed);
			KeyManager.addReleasedFunction(keyUp, onUpReleased);
			
			KeyManager.addPressedFunction(keyDown, onDownPressed);
			KeyManager.addReleasedFunction(keyDown, onDownReleased);
		}
		
		/** Move entity */
		public override function move():void {
			if (moveDirection == Direction.UP && mc.y > 0) {
				mc.y -= MOVE_SPEED;	
			} else if (moveDirection == Direction.DOWN && (mc.y + mc.height) < Main.STAGE_HEIGHT) {
				mc.y += MOVE_SPEED;
			}
		}
		
		/**
		 * Fire when the up-key is pressed
		 */
		private function onUpPressed():void {
			if (moveDirection != Direction.DOWN) {
				moveDirection = Direction.UP;
			} else if (moveDirection == Direction.DOWN) {
				moveDirection = Direction.NONE;
			}
		}
		
		/**
		 * Fire when the up-key is released
		 */
		private function onUpReleased():void {
			if (moveDirection == Direction.UP) {
				moveDirection = Direction.NONE;
			}
		}
		
		/**
		 * Fire when the down-key is pressed
		 */
		private function onDownPressed():void {
			if (moveDirection != Direction.UP) {
				moveDirection = Direction.DOWN;
			} else if (moveDirection == Direction.UP) {
				moveDirection = Direction.NONE;
			}
		}
		
		/**
		 * Fire when the down-key is released
		 */
		private function onDownReleased():void {
			if (moveDirection == Direction.DOWN) {
				moveDirection = Direction.NONE;
			}
		}
	}
}