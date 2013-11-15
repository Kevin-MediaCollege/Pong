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
		public static const MAX_TILT:int = 10;
		
		private var moveDirection:int;
		private var tiltDirection:int;
		
		private var tiltAmt:int;
		
		public function EntityPlayer(entityID:int) {
			super(entityID, new art_EntityPlayer());
			
			var keyUp:int;
			var keyLeft:int;
			var keyDown:int;
			var keyRight:int;
			
			switch(entityID) {
			case PLAYER_1:
				keyUp = Key.W;
				keyLeft = Key.A;
				keyDown = Key.S;
				keyRight = Key.D;
				
				spr.x = (spr.width / 2);
				break;
			case PLAYER_2:
				keyUp = Key.UP;
				keyLeft = Key.LEFT;
				keyDown = Key.DOWN;
				keyRight = Key.RIGHT;
				
				spr.x = Main.STAGE_WIDTH - (spr.width / 2);
				break;
			default:
				throw new Error("Entity ID is not supported");
			}
			
			spr.y = (Main.STAGE_HEIGHT / 2);
			
			KeyManager.addPressedFunction(keyUp, onUpPressed);
			KeyManager.addReleasedFunction(keyUp, onUpReleased);
			
			KeyManager.addPressedFunction(keyLeft, onLeftPressed);
			KeyManager.addReleasedFunction(keyLeft, onLeftReleased);
			
			KeyManager.addPressedFunction(keyDown, onDownPressed);
			KeyManager.addReleasedFunction(keyDown, onDownReleased);
			
			KeyManager.addPressedFunction(keyRight, onRightPressed);
			KeyManager.addReleasedFunction(keyRight, onRightReleased);
		}
		
		/** Move player */
		public override function move():void {
			if (moveDirection == Direction.UP && spr.y > (spr.height / 2)) {
				spr.y -= MOVE_SPEED;	
			} else if (moveDirection == Direction.DOWN && spr.y + (spr.height / 2) < Main.STAGE_HEIGHT) {
				spr.y += MOVE_SPEED;
			}
		}
		
		/**
		 * Tilt player
		 */
		public override function tilt():void {
			if (tiltDirection == Direction.LEFT && tiltAmt < MAX_TILT) {
				spr.rotation++;
				tiltAmt++;
			} else if (tiltDirection == Direction.RIGHT && tiltAmt > -MAX_TILT) {
				spr.rotation--;
				tiltAmt--;
			} else if(tiltDirection == Direction.NONE && tiltAmt != 0) {
				if (tiltAmt > 0) {
					spr.rotation--;
					tiltAmt--;
				} else if (tiltAmt < 0) {
					spr.rotation++;
					tiltAmt++;
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
		 * Fire when the left-key is pressed
		 */
		private function onLeftPressed():void {
			if (tiltDirection != Direction.RIGHT) {
				tiltDirection = Direction.LEFT;
			} else if (tiltDirection == Direction.RIGHT) {
				tiltDirection = Direction.NONE;
			}
		}
		
		/**
		 * Fire when the left-key is released
		 */
		private function onLeftReleased():void {
			if (tiltDirection == Direction.LEFT) {
				tiltDirection = Direction.NONE;
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
		
		/**
		 * Fire when the right-key is pressed
		 */
		private function onRightPressed():void {
			if (tiltDirection != Direction.LEFT) {
				tiltDirection = Direction.RIGHT;
			} else if (tiltDirection == Direction.LEFT) {
				tiltDirection = Direction.NONE;
			}
		}
		
		/**
		 * Fire when the right-key is released
		 */
		private function onRightReleased():void {
			if (tiltDirection == Direction.RIGHT) {
				tiltDirection = Direction.NONE;
			}
		}
	}
}