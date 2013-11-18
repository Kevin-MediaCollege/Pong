package pong {
	import flash.display.Shape;
	import flash.events.Event;
	import pong.audio.AudioManager;
	import pong.display.sAddChild;
	import pong.gui.GuiEnd;
	import pong.gui.GuiMain;
	import pong.gui.GuiSelect;
	import pong.input.KeyManager;
	import pong.world.World;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class Game {
		public static const STATE_MAIN:int = 0;
		public static const STATE_END:int = 1;
		public static const STATE_GAME:int = 2;
		public static const STATE_SELECT:int = 3;
		
		public static const BALL_DEFAULT:int = 0;
		public static const BALL_ICE:int = 1;
		public static const BALL_STAR:int = 2;
		
		public static var main:Main;
		
		private static var world:World;
		private static var guiMain:GuiMain;
		private static var guiEnd:GuiEnd;
		private static var guiSelect:GuiSelect;
		
		private static var state:int;
		
		public function Game(main:Main, state:int) {
			Game.main = main;
			
			KeyManager.initialize(main.stage);
			AudioManager.initialize();
			
			AudioManager.importAudio("hit", "Hit.mp3");
			AudioManager.importAudio("background", "Background.mp3", true, 9999, 0.5);
			
			addMask();
			
			updateState(state);
		}
		
		public function update(e:Event):void {
			switch(state) {
				case STATE_GAME:
					world.update();
					break;
			}
		}
		
		public function dispose():void {
			KeyManager.dispose();
			AudioManager.dispose();
			
			Game.main = null;
		}
		
		public static function updateState(newState:int):void {
			switch(newState) {
			case STATE_MAIN:
				if(guiMain) {
					guiMain.dispose();
					guiMain = null;
				}
				
				break;
			case STATE_END:
				if(guiEnd) {
					guiEnd.dispose();
					guiEnd = null;
				}
				
				break;
			case STATE_GAME:
				if(world) {
					world.dispose();
					world = null;
				}
				
				break;
			case STATE_SELECT:
				if (guiSelect) {
					guiSelect.dispose();
					guiSelect = null;
				}
				
				break;
			}
			
			Game.state = newState;
			
			switch(newState) {
			case STATE_MAIN:
				main.mouseChildren = true;
				guiMain = new GuiMain();
				break;
			case STATE_END:
				main.mouseChildren = true;
				guiEnd = new GuiEnd();
				break;
			case STATE_GAME:
				main.mouseChildren = false;
				world = new World();
				break;
			case STATE_SELECT:
				main.mouseChildren = true;
				guiSelect = new GuiSelect();
				break;
			}
		}
		
		private function addMask():void {
			var mask:Shape = new Shape();
			
			mask.graphics.beginFill(0x000000);
			mask.graphics.drawRect(0, 0, main.stage.stageWidth, main.stage.stageHeight);
			mask.graphics.endFill();
			
			sAddChild(mask, main);
			
			main.mask = mask;
		}
	}
}