package brotherhood.states.gameplay.heroes 
{
	import brotherhood.states.gameplay.heroes.crosshair.Crosshair;
	import brotherhood.states.gameplay.hud.HeroSlot;
	import brotherhood.states.gameplay.hud.HUD;
	import brotherhood.states.gameplay.hud.SkillSlot;
	import brotherhood.states.gameplay.hud.TowerSlot;
	import brotherhood.states.gameplay.Target;
	import brotherhood.system.EntityService;
	import brotherhood.system.SystemService;
	import flash.display.Bitmap;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Animation;
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
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
		
		public function Hero(slot:String) 
		{
			this.slot = slot;
			
			super();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			draw(Bitmap(new Assets.ImageHeroesHeroes).bitmapData);
			
			frame.width = 50;
			frame.height = 50;
			
			skillSlot = new SkillSlot(this);
			heroSlot = new HeroSlot(this);
			towerSlot = new TowerSlot(this);
			crosshair = new Crosshair(this);
			
			y = 105;
			
			if(slot == HUD.LEFT)
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
			trace(this);
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
			
			super.update();
		}
	}
}