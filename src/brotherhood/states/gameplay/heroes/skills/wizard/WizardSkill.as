package brotherhood.states.gameplay.heroes.skills.wizard 
{
	import brotherhood.states.gameplay.heroes.skills.Skill;
	import brotherhood.states.gameplay.heroes.wizard.Wizard;
	import brotherhood.system.EntityService;
	
	public class WizardSkill extends Skill 
	{
		protected var wizard:Wizard;
		
		public function WizardSkill() 
		{
			wizard = EntityService.wizard;
		}
	}
}