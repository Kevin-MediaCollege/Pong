package pong.gui {
	import flash.display.MovieClip;
	import pong.display.sAddChild;
	import pong.Game;
	import pong.Main;
	
	/**
	 * @author Kevin Krol
	 * @since 17-11-2013
	 */
	public class GuiMain extends MovieClip {
		private var btnStart:GuiButton;
		
		public function GuiMain() {
			sAddChild(new art_BackgroundStart(), Game.main);
			
			btnStart = new GuiButton(new art_ButtonStart(), Main.STAGE_WIDTH / 2, 600, changeState);
		}
		
		/** Dispose of the gui */
		public function dispose():void {
			btnStart.dispose();
			
			btnStart = null;
		}
		
		/** Change the state */
		private function changeState():void {
			Game.updateState(Game.STATE_SELECT);
		}
	}
}