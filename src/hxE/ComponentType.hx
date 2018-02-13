package hxE;

/**
 * ...
 * @author P Svilans
 */
class ComponentType<T:Component> implements IComponentType
{
	
	public var id:Int;
	
	public var componentClass:Class<T>;
	
	public function new( componentClass:Class<T>, id:Int) 
	{
		this.componentClass = componentClass;
		
		this.id = id;
	}
	
}