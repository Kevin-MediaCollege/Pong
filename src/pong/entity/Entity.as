package pong.entity {
	import flash.display.Sprite;
	import pong.display.sAddChild;
	import pong.Game;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class Entity extends Sprite {		
		public var entityID:int;
		
		public var spr:Sprite;
		
		public function Entity(entityID:int, spr:Sprite) {
			this.entityID = entityID;
			this.spr = spr;
			
			sAddChild(spr, Game.main);
		}
		
		/**
		 * Entity update method
		 */
		public function update():void {
			move();
			tilt();
		}
		
		/**
		 * Move entity
		 */
		public function move():void {
			
		}
		
		/**
		 * Tilt entity
		 */
		public function tilt():void {
			
		}
	}
}