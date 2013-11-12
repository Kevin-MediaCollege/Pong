package pong.entity {
	import flash.display.MovieClip;
	import pong.display.sAddChild;
	import pong.Game;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class Entity extends MovieClip {		
		public var entityID:int;
		
		protected var mc:MovieClip;
		
		public function Entity(entityID:int, mc:MovieClip) {
			this.entityID = entityID;
			this.mc = mc;
			
			sAddChild(mc, Game.main);
		}
		
		/** Entity update method */
		public function update():void {
			move();
		}
		
		/** Move entity */
		public function move():void {
			
		}
	}
}