package pong.world {
	import pong.entity.EntityBall;
	import pong.entity.EntityPlayer;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class World {
		public static var players:Vector.<EntityPlayer>;
		public static var balls:Vector.<EntityBall>;
		
		private var backgroundHandler:WorldBackground;
		
		public function World() {
			players = new Vector.<EntityPlayer>();
			balls = new Vector.<EntityBall>();
			
			backgroundHandler = new WorldBackground();
			
			players.push(new EntityPlayer(EntityPlayer.PLAYER_1));
			players.push(new EntityPlayer(EntityPlayer.PLAYER_2));
			
			balls.push(new EntityBall());
		}
		
		/**
		 * World update method
		 */
		public function update():void {
			backgroundHandler.update();
			
			for each(var p:EntityPlayer in players) {
				p.update();
			}
			
			for each(var b:EntityBall in balls) {
				b.update();
			}
		}
	}
}