//
// Flambe - Rapid game development
// https://github.com/aduros/flambe/blob/master/LICENSE.txt

package flambe.platform;

import flambe.animation.Property;
import flambe.sound.Playback;
import flambe.sound.Sound;

/**
 * An empty sound used in environments that don't support audio.
 */
class DummySound
    implements Sound
{
    public var duration (getDuration, null) :Float;

    public function new ()
    {
        _playback = new DummyPlayback(this);
    }

    public function play (volume :Float = 1.0) :Playback
    {
        return _playback;
    }

    public function loop (volume :Float = 1.0) :Playback
    {
        return _playback;
    }

    public function getDuration () :Float
    {
        return 0;
    }

    public static function getInstance () :DummySound
    {
        if (_instance == null) {
            _instance = new DummySound();
        }
        return _instance;
    }

    private static var _instance :DummySound;

    private var _playback :DummyPlayback;
}

// This should be immutable too
private class DummyPlayback
    implements Playback
{
    public var volume (default, null) :PFloat;
    public var paused (isPaused, setPaused) :Bool;
    public var ended (isEnded, null) :Bool;
    public var position (getPosition, null) :Float;
    public var sound (getSound, null) :Sound;

    public function new (sound :Sound)
    {
        _sound = sound;
        this.volume = new PFloat(0); // A little quirky? All DummyPlaybacks share the same volume
    }

    public function getSound () :Sound
    {
        return _sound;
    }

    public function isPaused () :Bool
    {
        return true;
    }

    public function setPaused (paused :Bool) :Bool
    {
        return true;
    }

    public function isEnded () :Bool
    {
        return true;
    }

    public function getPosition () :Float
    {
        return 0;
    }

    public function dispose ()
    {
        // Nothing
    }

    private var _sound :Sound;
}
