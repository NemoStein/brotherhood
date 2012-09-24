package brotherhood.states.gameplay.heroes.wizard
{
	import brotherhood.states.gameplay.heroes.crosshair.Crosshair;
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.states.gameplay.heroes.skills.Upgrade;
	import brotherhood.states.gameplay.heroes.skills.wizard.Companions;
	import brotherhood.states.gameplay.heroes.skills.wizard.FieryArrows;
	import brotherhood.states.gameplay.heroes.skills.wizard.Icewave;
	import brotherhood.states.gameplay.heroes.skills.wizard.Regeneration;
	import brotherhood.states.gameplay.heroes.skills.wizard.Teleport;
	
	public class Wizard extends Hero
	{
		public function Wizard(slot:String)
		{
			super(slot);
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			skills.push(new FieryArrows());
			skills.push(new Icewave());
			skills.push(new Upgrade());
			skills.push(new Regeneration());
			skills.push(new Teleport());
			skills.push(new Companions());
		}
	}
}