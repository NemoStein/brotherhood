package brotherhood.states.gameplay.heroes
{
	import assets.heroes.AssetHeroes;
	import brotherhood.states.gameplay.heroes.crosshair.Crosshair;
	import brotherhood.states.gameplay.heroes.skills.Skill;
	import brotherhood.states.gameplay.hud.HeroSlot;
	import brotherhood.states.gameplay.hud.HUD;
	import brotherhood.states.gameplay.hud.SkillSlot;
	import brotherhood.states.gameplay.hud.TowerSlot;
	import brotherhood.states.gameplay.Target;
	import brotherhood.system.EntityService;
	import brotherhood.system.SystemService;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	
	public class Hero extends Core implements Target
	{
		public var lookLeft:int;
		public var lookRight:int;
		
		public var skillSlot:SkillSlot;
		public var heroSlot:HeroSlot;
		public var towerSlot:TowerSlot;
		
		public var crosshair:Crosshair;
		public var slot:String;
		
		public var currentHP:Number = 100;
		public var totalHP:Number = 100;
		public var currentXP:Number = 100;
		public var level:int = 1;
		
		public var skills:Vector.<Skill>;
		
		public function Hero(slot:String)
		{
			this.slot = slot;
			
			super();
		}
		
		public function build():void 
		{
			draw(new AssetHeroes().bitmapData);
			
			frame.width = 50;
			frame.height = 50;
			
			skillSlot = new SkillSlot(this);
			heroSlot = new HeroSlot(this);
			towerSlot = new TowerSlot(this);
			crosshair = new Crosshair(this);
			
			skills = new Vector.<Skill>(6, true);
			
			y = 105;
			
			if (slot == HUD.LEFT)
			{
				EntityService.slot1 = this;
				lookLeft = 1;
				lookRight = 2;
				x = 410;
			}
			else
			{
				EntityService.slot2 = this;
				lookLeft = 0;
				lookRight = 1;
				x = 870;
			}
			
			alignAnchor(AnchorAlign.BOTTOM, AnchorAlign.CENTER);
			
			add(skillSlot);
			add(heroSlot);
			add(towerSlot);
			add(crosshair);
		}
		
		public function useSkill(value:int):void
		{	
			var skill:Skill = skills[value];
			if (skill)
			{
				skill.activate();
			}
		}
		
		public function addXP(xp:int):void
		{
			currentXP += xp;
			
			if (currentXP >= experienceToLevel(level))
			{
				levelUp();
			}
		}
		
		private function levelUp():void
		{
			currentXP -= experienceToLevel(level++);
		}
		
		protected function upgrade():void
		{
		
		}
		
		public function experienceToLevel(level:int = -1):int
		{
			if (level == -1)
			{
				level = this.level;
			}
			
			if (level == 1)
			{
				return 100;
			}
			
			return experienceToLevel(level - 1) * 1.2;
		}
		
		public function hit(power:Number):void
		{
			currentHP -= power;
		}
		
		override protected function update():void
		{
			if (currentHP <= 0)
			{
				currentHP = 0;
				SystemService.defeat();
			}
			
			for (var i:int = 0; i < 6; ++i)
			{
				var skill:Skill = skills[i];
				if (skill)
				{
					skill.update(time);
				}
			}
			
			super.update();
		}
	}
}