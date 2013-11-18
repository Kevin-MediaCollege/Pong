package pong.gui {
	import flash.display.MovieClip;
	import pong.display.sAddChild;
	import pong.Game;
	import pong.Main;
	
	/**
	 * @author Kevin Krol
	 * @since 17-11-2013
	 */
	public class GuiSelect extends MovieClip {
		public static var selected:int;
		
		private var btnStart:GuiButton;
		
		private var btnBallDefault:GuiButton;
		private var btnBallIce:GuiButton;
		private var btnBallStar:GuiButton;
		
		public function GuiSelect() {
			sAddChild(new art_BackgroundStart(), Game.main);
			
			btnStart = new GuiButton(new art_ButtonStart(), Main.STAGE_WIDTH / 2, 600, changeState);
			
			btnBallDefault = new GuiButton(new art_EntityBall(), Main.STAGE_WIDTH / 2 - 50, 500, selectBall);
			btnBallIce = new GuiButton(new art_EntityBallIce(), Main.STAGE_WIDTH / 2, 500, selectBall);
			btnBallStar = new GuiButton(new art_EntityBallStar(), Main.STAGE_WIDTH / 2 + 50, 500, selectBall);
		}
		
		/** Dispose of the gui */
		public function dispose():void {
			btnStart.dispose();
			
			btnStart = null;
		}
		
		/** Change the state */
		private function changeState():void {
			Game.updateState(Game.STATE_GAME);
		}
		
		private function selectBall():void {
			if (btnBallDefault.pressed) {
				btnBallIce.pressed = false;
				btnBallStar.pressed = false;
				
				selected = 0;
			} else if (btnBallIce.pressed) {
				btnBallDefault.pressed = false;
				btnBallStar.pressed = false;
				
				selected = 1;
			} else if (btnBallStar.pressed) {
				btnBallDefault.pressed = false;
				btnBallIce.pressed = false;
				
				selected = 2;
			}
			
			btnBallDefault.pressed = false;
			btnBallIce.pressed = false;
			btnBallStar.pressed = false;
		}
	}
}