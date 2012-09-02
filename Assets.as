package
{

	public class Assets
	{
		[Embed(source="assets/animationSample.png")]
		public static const ImageAnimationSample:Class;
		
		[Embed(source="assets/waves/testLevel.txt",mimeType="application/octet-stream")]
		public static const TextWavesTestLevel:Class;
	}
}
