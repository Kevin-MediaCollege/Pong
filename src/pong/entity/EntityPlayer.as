package pong.entity {
	import pong.input.Key;
	import pong.input.KeyManager;
	import pong.Main;
	import pong.utils.geom.Direction;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class EntityPlayer extends Entity {
		public static const PLAYER_1:int = 1;
		public static const PLAYER_2:int = 2;
		
		public static const MOVE_SPEED:int = 5;
		
		private var moveDirection:int;
		
		public function EntityPlayer(entityID:int) {
			super(entityID, new art_EntityPlayer());
			
			var keyUp:int;
			var keyDown:int;
			
			switch(entityID) {
			case PLAYER_1:
				keyUp = Key.W;
				keyDown = Key.S;
				
				spr.x = 0;
				spr.y = (Main.STAGE_HEIGHT / 2) - (spr.height / 2);
				
				break;
			case PLAYER_2:
				keyUp = Key.UP;
				keyDown = Key.DOWN;
				
				spr.x = Main.STAGE_WIDTH;
				spr.y = (Main.STAGE_HEIGHT / 2) + (spr.height / 2);
				spr.rotation = 180;
				
				break;
			default:
				throw new Error("Entity ID is not supported");
			}
			
			KeyManager.addPressedFunction(keyUp, onUpPressed);
			KeyManager.addReleasedFunction(keyUp, onUpReleased);
			
			KeyManager.addPressedFunction(keyDown, onDownPressed);
			KeyManager.addReleasedFunction(keyDown, onDownReleased);
		}
		
		public override function update():void {
			move();
		}
		
		/** Move player */
		private function move():void {
			switch(entityID) {
			case EntityPlayer.PLAYER_1:
				if (moveDirection == Direction.UP && spr.y > 0) {
					spr.y -= MOVE_SPEED;	
				} else if (moveDirection == Direction.DOWN && spr.y + spr.height < Main.STAGE_HEIGHT) {
					spr.y += MOVE_SPEED;
				}
				
				break;
			case EntityPlayer.PLAYER_2:
				if (moveDirection == Direction.UP && spr.y - spr.height > 0) {
					spr.y -= MOVE_SPEED;	
				} else if (moveDirection == Direction.DOWN && spr.y < Main.STAGE_HEIGHT) {
					spr.y += MOVE_SPEED;
				}
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