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
		
		override public function build():void
		{
			super.build();
			
			skills[0] = new FieryArrows();
			skills[1] = new Icewave();
			skills[2] = new Upgrade();
			skills[3] = new Regeneration();
			skills[4] = new Teleport();
			skills[5] = new Companions();
			
			skillSlot.buildMeters();
		}
	}
}