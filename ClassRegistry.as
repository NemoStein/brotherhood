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
			brotherhood.states.gameplay.creeps.melee.Normal;
			brotherhood.states.gameplay.creeps.ranged.Normal;
			brotherhood.states.gameplay.waves.Alive;
			brotherhood.states.gameplay.waves.HeroLife;
			brotherhood.states.gameplay.waves.Time;
		}
	}
}