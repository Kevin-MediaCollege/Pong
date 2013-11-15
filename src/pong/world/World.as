package pong.world {
	import pong.entity.EntityBall;
	import pong.entity.EntityPlayer;
	import pong.obstacles.Obstacle;
	import pong.obstacles.ObstacleSpawner;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class World {
		public static var players:Vector.<EntityPlayer>;
		public static var obstacles:Vector.<Obstacle>;
		public static var balls:Vector.<EntityBall>;
		
		private var backgroundHandler:WorldBackground;
		
		public function World() {
			players = new Vector.<EntityPlayer>();
			obstacles = new Vector.<Obstacle>();
			balls = new Vector.<EntityBall>();
			
			backgroundHandler = new WorldBackground();
			
			players.push(new EntityPlayer(EntityPlayer.PLAYER_1));
			players.push(new EntityPlayer(EntityPlayer.PLAYER_2));
			
			balls.push(new EntityBall());
			
			new ObstacleSpawner();
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
			
			for each(var o:Obstacle in obstacles) {
				o.update();
			}
		}
	}
}