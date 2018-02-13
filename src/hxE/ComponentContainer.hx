package hxE;
import hxE.Component;

import de.polygonal.ds.ArrayList;
/**
 * ...
 * @author P Svilans
 */
class ComponentContainer<T:Component> extends ComponentContainerBase
{
	
	public var container:ArrayList<T>;
	
	public function new() 
	{
		super();
		
		container = new ArrayList<T>();
	}
	
	override public function remove( index:Int ):Void
	{
		container.removeAt(index);
	}
	
	override public function has( index:Int ):Bool 
	{
		return container.get(index) != null;
	}
	
	override public function setComponent( index:Int, c:Component ):Void 
	{
		container.set(index, cast c);
	}
	
	public function set( index:Int, c:T ):Void
	{
		container.set(index, c);
	}
	
	override public function getComponent( index:Int ):Component 
	{
		return container.get(index);
	}
	
	public function get( index:Int ):T
	{
		return container.get(index);
	}
	
	override public function getArray():Array<Dynamic> 
	{
		return container.toArray();
	}
	
}