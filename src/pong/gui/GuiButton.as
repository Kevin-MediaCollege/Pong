package pong.gui {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import pong.display.sAddChild;
	import pong.display.sRemoveChild;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import pong.Game;
	
	/**
	 * @author Kevin Krol
	 * @since 17-11-2013
	 */
	public class GuiButton extends MovieClip {
		public static const STATE_NORMAL:int = 1;
		public static const STATE_OVER:int = 2;
		public static const STATE_DOWN:int = 3;
		
		public var pressed:Boolean;
		
		private var task:Function;
		private var newState:int;
		
		private var mc:MovieClip;
		
		private var over:Boolean;
		
		public function GuiButton(mc:MovieClip, x:Number, y:Number, task:Function) {
			this.mc = mc;
			
			this.mc.x = x;
			this.mc.y = y;
			
			this.task = task;
			this.newState = newState;
			
			mc.gotoAndStop(STATE_NORMAL);
			
			mc.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			mc.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			mc.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			mc.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			
			sAddChild(mc, Game.main);
		}
		
		/** Dispose of the button */
		public function dispose():void {
			mc.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			mc.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			mc.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			mc.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			
			sRemoveChild(mc, Game.main);
		}
		
		/**
		 * Fires when the mouse goes over the movieclip
		 * @param e
		 */
		private function onMouseOver(e:MouseEvent):void {
			over = true;
			Mouse.cursor = MouseCursor.BUTTON;
			
			mc.gotoAndStop(STATE_OVER);
		}
		
		/**
		 * Fires when the mouse is pressed on the movieclip
		 * @param e
		 */
		private function onMouseDown(e:MouseEvent):void {
			mc.gotoAndStop(STATE_DOWN);
		}
		
		/**
		 * Fires when the mouse is released
		 * @param e
		 */
		private function onMouseUp(e:MouseEvent):void {
			if (over) {
				pressed = true;
				task.call();
			} else {
				mc.gotoAndStop(STATE_OVER);
			}
		}
		
		/**
		 * Fires when the mouse leaves the movieclip
		 * @param e
		 */
		private function onMouseOut(e:MouseEvent):void {
			over = false;
			Mouse.cursor = MouseCursor.ARROW;
			
			mc.gotoAndStop(STATE_NORMAL);
		}
	}
}