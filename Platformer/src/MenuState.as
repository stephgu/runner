package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		override public function create(): void
		{
			var t: FlxText;
			t = new FlxText(40, FlxG.height/2-40, FlxG.width, "Body Runner");
			t.size = 32;
			t.alignment = "left";
			add(t);
			t = new FlxText(60, FlxG.height/2, FlxG.width, "Press space to start")

			t.size = 16;
			t.alignment = "left";
			add(t);

			FlxG.mouse.show();
		}

		override public function update():void
		{
			super.update();

			if (FlxG.keys.SPACE) {
				FlxG.switchState(new PlayState());
			}
		}
	}
}
