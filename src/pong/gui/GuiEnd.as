package pong.gui {
	import flash.display.MovieClip;
	import pong.display.sAddChild;
	import pong.Game;
	import pong.Main;
	
	/**
	 * @author Kevin Krol
	 * @since 17-11-2013
	 */
	public class GuiEnd extends MovieClip {
		private var btnEnd:GuiButton;
		
		public function GuiEnd() {
			sAddChild(new art_BackgroundStart(), Game.main);
			
			btnEnd = new GuiButton(new art_ButtonRestart(), Main.STAGE_WIDTH / 2, 580, changeState);
		}
		
		/** Dispose of the gui */
		public function dispose():void {
			btnEnd.dispose();
			
			btnEnd = null;
		}
		
		/** Change the state */
		private function changeState():void {
			Game.updateState(Game.STATE_GAME);
		}
	}
}