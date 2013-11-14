package pong {
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class Main extends Sprite {
		public static const STAGE_WIDTH:int = 480;
		public static const STAGE_HEIGHT:int = 640;
		
		public static const FRAME_RATE_NORMAL:int = 30;
		public static const FRAME_RATE_STANDBY:int = 0;
		
		private var game:Game;
		
		public function Main() {
			game = new Game(this);
			
			if (stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event = null):void {
			if (hasEventListener(Event.ADDED_TO_STAGE)) {
				removeEventListener(Event.ADDED_TO_STAGE, init);
			}
			
			mouseChildren = false;
			
			stage.addEventListener(Event.ACTIVATE, start);
			stage.addEventListener(Event.DEACTIVATE, stop);
		}
		
		private function start(e:Event):void {
			if(!hasEventListener(Event.ENTER_FRAME)) {
				addEventListener(Event.ENTER_FRAME, game.update);
			}
			
			stage.frameRate = FRAME_RATE_NORMAL;
		}
		
		private function stop(e:Event):void {
			stage.frameRate = FRAME_RATE_STANDBY;
		}
	}
}