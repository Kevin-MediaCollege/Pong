package pong.world {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import pong.Main;
	import pong.display.sAddChild;
	import pong.Game;
	import pong.utils.geom.nextX;
	import pong.utils.geom.nextY;
	import pong.display.sRemoveChild;
	import pong.world.World;
	
	/**
	 * @author Kevin Krol
	 * @since 15-11-2013
	 */
	public class WorldAmbient extends MovieClip {
		public static const SPEED:int = 5;
		
		public var mc:MovieClip;
		
		private var angle:int;
		
		public function WorldAmbient(mc:MovieClip) {
			var tempY:int = Math.round(Math.random());
			trace(tempY);
			
			this.mc = mc;
			this.angle = (Math.floor(Math.random() * (180 - 90 + 1)) + 90);
			this.mc.x = Math.floor(Math.random() * Main.STAGE_WIDTH);
			
			switch(tempY) {
			case 0:
				this.mc.y = -mc.height * 2;
				this.mc.rotation = (angle - 90) * 2;
				break;
			case 1:
				this.mc.y = Main.STAGE_HEIGHT + (mc.height * 2);
				this.mc.rotation = angle + 90;
				break;
			}
			
			sAddChild(this.mc, Game.main);
		}
		
		/**
		 * Ambient update method
		 */
		public function update():void {
			mc.x = nextX(mc.x, angle, SPEED);
			mc.y = nextY(mc.y, angle, SPEED);
			
			if (mc.y < -mc.height || mc.y > Main.STAGE_HEIGHT + mc.height || mc.x < -mc.width || mc.x > Main.STAGE_WIDTH + mc.width) {
				sRemoveChild(this, Game.main);
				World.ambient.splice(World.ambient.indexOf(this), 1);
			}
		}
	}
}