//
// Flambe - Rapid game development
// https://github.com/aduros/flambe/blob/master/LICENSE.txt

package flambe.swf;

import flambe.display.Sprite;

interface Symbol
{
    var name (getName, null) :String;

    function createSprite () :Sprite;
}
