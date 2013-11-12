package pong.world {
	import pong.entity.EntityPlayer;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 * @version 1.0
	 */
	public class World {
		private var players:Vector.<EntityPlayer>;
		
		public function World() {
			players = new Vector.<EntityPlayer>();
			
			players.push(new EntityPlayer(EntityPlayer.PLAYER_1));
			players.push(new EntityPlayer(EntityPlayer.PLAYER_2));
		}
		
		/**
		 * World update method
		 */
		public function update():void {
			for each(var p:EntityPlayer in players) {
				p.update();
			}
		}
	}
}