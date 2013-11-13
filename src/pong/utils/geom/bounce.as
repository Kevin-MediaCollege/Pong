package pong.utils.geom {
	
	/**
	 * @since 13/11/2013
	 * @author Kevin Krol 
	 */
	
	/**
	 * Bounce an object
	 * @param angle
	 * @param hitAngle
	 * @return the new angle
	 */
	public function bounce(angle:Number, hitAngle:Number):Number {
		var i:Number = angle - hitAngle;
		var newAngle:Number = (i - (i * 2) + 180) + hitAngle;
		
		if (i == 0) {
			return 180 + hitAngle;
		}
		
		return newAngle;
	}
}