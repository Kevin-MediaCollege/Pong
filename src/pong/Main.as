package pong {
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 * @version 1.01
	 */
	public class Main extends Sprite {
		public static const STAGE_WIDTH:int = 480;
		public static const STAGE_HEIGHT:int = 640;
		
		private var game:Game;
		
		public function Main() {
			game = new Game(this);
			
			if (stage) {
				addEventListener(Event.ENTER_FRAME, game.update);
			} else {
				addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			}
		}
		
		/**
		 * Execute when the ADDED_TO_STAGE event has been fired
		 * @param e
		 */
		private function onAddedToStage(e:Event):void {			
			removeEventListener(Event.ENTER_FRAME, onAddedToStage);
			
			addEventListener(Event.ENTER_FRAME, game.update);
		}
	}
}