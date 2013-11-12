package pong.display {
	import flash.display.DisplayObjectContainer;
	import flash.display.DisplayObject;

	/**
	 * removeChildAt.as
	 * @since 31/10/2013
	 * @author Kevin Krol 
	 */
	
	/**
	 * Remove a child from a specified layer
	 * @param parent
	 * @param atIndex
	 * @return the child if it has been removed successfully
	 */
	public function sRemoveChildAt(parent:DisplayObjectContainer, atIndex:int = -1):DisplayObject {
		if(parent && parent.numChildren > 0) {
			if(atIndex < 0 || atIndex > parent.numChildren) {
				atIndex = parent.numChildren;
			}
			
			return parent.removeChildAt(atIndex);
		}
		
		return null;
	}
}
