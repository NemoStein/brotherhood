package
{
	import brotherhood.states.gameplay.creeps.melee.Normal;
	import brotherhood.states.gameplay.creeps.ranged.Normal;
	import brotherhood.states.gameplay.waves.Alive;
	import brotherhood.states.gameplay.waves.HeroLife;
	import brotherhood.states.gameplay.waves.Time;
	
	public class ClassRegistry
	{
		static public function register():void
		{
			// Creep types registry
			brotherhood.states.gameplay.creeps.melee.Normal
			brotherhood.states.gameplay.creeps.ranged.Normal
			
			// Wave types registry
			Time;
			HeroLife;
			Alive;
		}
	}
}