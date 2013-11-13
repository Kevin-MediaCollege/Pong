package pong.display {
	
	/**
	 * @since 13/11/2013
	 * @author Kevin Krol 
	 */
	
	/**
	 * Check if the supplied display object is currently on the stage
	 * @param obj
	 * @return true if the display object is on the stage
	 */
	public function isVisible(obj:DisplayObject):Boolean {
		for (var cur:DisplayObject = obj; cur != null; cur = cur.parent) {
			if (!cur.visible) {
				return false;
			}
		}
		
		return true;
	}
}