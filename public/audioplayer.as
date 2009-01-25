/**
 * Part of MooSound <http://widgets.rabidlabs.net/sound>
 * I'm no AS expert, so some of this is probably pretty messy.
 * @copyright 2007, 2008 Michelle Steigerwalt <msteigerwalt.com>
 * @license LGPL 2.1
 */

import flash.external.*;
import System.security.*;

System.security.allowDomain("*");

var preloaded:Object = new Object();
var sounds:Object = new Object();
var callback = "$.mediaPlayer.events.";

function preloadSound(url:String) {
	var s = newSound(url, false);
	preloaded[url] = s;
}

function newSound(url:String, streaming:Boolean):Sound {
	var s = new Sound();
	s.loadSound(url, streaming);
	s.url = url;
	s.registered = true;
	sounds[url] = s;
	s.onID3 = function ():Void {
		for (var prop in s.id3) { 
			flash.external.ExternalInterface.call(callback+"registerID3", url, prop, s.id3[prop]); 
		}
	};
	
	s.onLoad = function (success:Boolean):Void {
		if (success) {
			s.loaded = true;
			flash.external.ExternalInterface.call(callback+"onMediaLoaded", s.url);
		}

	};
	
	s.onSoundComplete = function ():Void {
		flash.external.ExternalInterface.call(callback+"onMediaComplete", s.url);
	};
	
	return s;
}

function startSound(url:String, position:Number, volume:Number, pan:Number):Boolean {
	if (position > 0) { var pos = position / 1000; }
	else { var pos = 0; }
	var s = preloaded[url];
	if (s.registered == true) {
		s.start(pos);
		return true;
	} else {
		var s = sounds[url];
		if (s.registered == true) { s.start(pos); }
		else { var s = newSound(url, true);  s.start(pos); }
		s.start(pos);
		return true;
	}
}

function setVolume(url:String, vol:Number):Void {
	var s = sounds[url];
	s.setVolume(vol);
}

function setPan(url:String, pan:Number):Void {
	var s = sounds[url];
	s.setPan(pan);
}

function getProgress(url) {
	s = sounds[url];
	if (s == null) { return 0; }
	return Math.floor(s.getBytesLoaded() / s.getBytesTotal() * 100);
}

function getBytesLoaded(url) {
	s = sounds[url];
	if (s == null) return 0; 
	return s.getBytesLoaded();
}

function getBytesTotal(url) {
	s = sounds[url];
	if (s == null) return 0;
	return s.getBytesTotal();
}

function getPosition(url) {
	s = sounds[url];
	return Math.floor(s.position);
}

function stopSound(url) {
	var s = sounds[url];
	s.stop();
	s.position = 0;
}

function getDuration(url) {
	s = sounds[url];
	return s.duration / (getProgress(url)/100);
}

flash.external.ExternalInterface.addCallback("startSound",      this, startSound);
flash.external.ExternalInterface.addCallback("preloadSound",    this, preloadSound);
flash.external.ExternalInterface.addCallback("getBytesLoaded",  this, getBytesLoaded);
flash.external.ExternalInterface.addCallback("getBytesTotal",   this, getBytesTotal);
flash.external.ExternalInterface.addCallback("setVolume",       this, setVolume);
flash.external.ExternalInterface.addCallback("setPan",          this, setPan);
flash.external.ExternalInterface.addCallback("getPosition",     this, getPosition);
flash.external.ExternalInterface.addCallback("getDuration",     this, getDuration);
flash.external.ExternalInterface.addCallback("stopSounds",      this, stopSounds);
flash.external.ExternalInterface.addCallback("stopSound",       this, stopSound);
flash.external.ExternalInterface.call(callback+"onFlashLoaded", true);
