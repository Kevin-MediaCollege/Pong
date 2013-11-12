package pong.input {
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;
	
	/**
	 * @since 30/10/2013
	 * @author Kevin Krol 
	 */
	public class KeyManager {
		private static var releasedFunctions:Dictionary;
		private static var pressedFunctions:Dictionary;
		private static var keys:Dictionary;
		
		private static var initialized:Boolean;
		
		private static var stage:Stage;
		
		/**
		 * Initialize the key manager
		 * @param stage
		 */
		public static function initialize(_stage:Stage):void {
			if (initialized)
				return;
				
			releasedFunctions = new Dictionary(true);
			pressedFunctions = new Dictionary(true);
			keys = new Dictionary(true);
			
			initialized = true;
			
			stage = _stage;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		/**
		 * Set a function to be exectuted when the specified key is pressed
		 * @param keyCode
		 * @param listener
		 */
		public static function addPressedFunction(keyCode:uint, listener:Function):void {
			if (pressedFunctions[keyCode] == undefined) {
				pressedFunctions[keyCode] = new <Function>[listener];
			} else {
				pressedFunctions[keyCode].push(listener);
			}
		}
		
		/**
		 * Stop a function from being executed when the specified key is pressed
		 * @param keyCode
		 * @param listener
		 */
		public static function removePressedFunction(keyCode:uint, listener:Function):void {
			if (pressedFunctions[keyCode] != undefined) {
				pressedFunctions[keyCode].splice(pressedFunctions[keyCode].indexOf(listener), 1);
				
				if (pressedFunctions[keyCode].length == 0) {
					delete pressedFunctions[keyCode];
				}
			}
		}
		
		/**
		 * Set a function to be exectuted when the specified key is released
		 * @param keyCode
		 * @param listener
		 */
		public static function addReleasedFunction(keyCode:uint, listener:Function):void {
			if (releasedFunctions[keyCode] == undefined) {
				releasedFunctions[keyCode] = new <Function>[listener];
			} else {
				releasedFunctions[keyCode].push(listener);
			}
		}
		
		/**
		 * Stop a function from being executed when the specified key is released
		 * @param keyCode
		 * @param listener
		 */
		public static function removeReleasedFunction(keyCode:uint, listener:Function):void {
			if (releasedFunctions[keyCode] != undefined) {
				releasedFunctions[keyCode].splice(releasedFunctions[keyCode].indexOf(listener), 1);
				
				if (releasedFunctions[keyCode].length == 0) {
					delete releasedFunctions[keyCode];
				}
			}
		}
		
		/**
		 * Handler for when a key is held down
		 * @param keyCode
		 * @return true if the key is held down or false if it isn't
		 */
		public static function onKeyHeld(keyCode:uint):Boolean {
			if (keys[keyCode] == undefined) {
				return false;
			}
				
			return keys[keyCode];
		}
		
		/**
		 * Get the state of the specified key
		 * @return true if the key is down or false if it's up
		 */
		public static function getKeyState(keyCode:uint):Boolean {
			if (keys[keyCode] != undefined) {
				if (keys[keyCode]) {
					return true;
				}
			}
			
			return false;
		}
		
		/**
		 * Dispose of the key manager
		 */
		public static function dispose():void {
			initialized = false;
			
			releasedFunctions = null;
			pressedFunctions = null;
			stage = null;
			keys = null;
		}
		
		/**
		 * On key down handler
		 * @param e
		 */
		private static function onKeyDown(e:KeyboardEvent):void {
			e.preventDefault();
			
			if (keys[e.keyCode] == undefined) {
				keys[e.keyCode] = false;
			}
			
			if (!keys[e.keyCode]) {
				keys[e.keyCode] = true;
				
				for each(var pressedFunction:Function in pressedFunctions[e.keyCode]) {
					pressedFunction.call();
				}
			}
		}
		
		/**
		 * On key up handler
		 * @param e
		 */
		private static function onKeyUp(e:KeyboardEvent):void {
			if (keys[e.keyCode] == undefined) {
				keys[e.keyCode] = true;
			}
			
			if (keys[e.keyCode]) {
				keys[e.keyCode] = false;
				
				for each(var releasedFunction:Function in releasedFunctions[e.keyCode]) {
					releasedFunction.call();
				}
			}
		}
	}
}