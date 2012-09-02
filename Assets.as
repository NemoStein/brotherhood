package
{

	public class Assets
	{
		[Embed(source="assets/background.jpg")]
		public static const ImageBackground:Class;
		
		[Embed(source="assets/colours.txt",mimeType="application/octet-stream")]
		public static const TextColours:Class;
		
		[Embed(source="assets/controls.txt",mimeType="application/octet-stream")]
		public static const TextControls:Class;
		
		[Embed(source="assets/creeps.png")]
		public static const ImageCreeps:Class;
		
		[Embed(source="assets/crosshairs/archer.png")]
		public static const ImageCrosshairsArcher:Class;
		
		[Embed(source="assets/crosshairs/wizard.png")]
		public static const ImageCrosshairsWizard:Class;
		
		[Embed(source="assets/heroes.png")]
		public static const ImageHeroes:Class;
		
		[Embed(source="assets/skills/archer.png")]
		public static const ImageSkillsArcher:Class;
		
		[Embed(source="assets/skills/backgroundBlue.png")]
		public static const ImageSkillsBackgroundBlue:Class;
		
		[Embed(source="assets/skills/backgroundGreen.png")]
		public static const ImageSkillsBackgroundGreen:Class;
		
		[Embed(source="assets/skills/backgroundRed.png")]
		public static const ImageSkillsBackgroundRed:Class;
		
		[Embed(source="assets/skills/wizard.png")]
		public static const ImageSkillsWizard:Class;
		
		[Embed(source="assets/waves/testLevel.txt",mimeType="application/octet-stream")]
		public static const TextWavesTestLevel:Class;
	}
}
