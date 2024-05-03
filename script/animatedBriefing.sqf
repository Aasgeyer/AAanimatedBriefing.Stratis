/*
	Animated Briefing Demo by Aasgeyer

	https://community.bistudio.com/wiki/Arma_3:_Animated_Briefing
	https://community.bistudio.com/wiki/BIS_fnc_animatedBriefing

	useful functions for animating markers and the map, (optional argument):
	["markerPrefix_"] call BIS_fnc_getMarkers
	[marker, (blinkDuration), (blinkAmount)] spawn BIS_fnc_blinkMarker
	[marker, (duration), (fadeTime), (sizeMultiplier), (angleOffset)] spawn BIS_fnc_cancelMarker
	[marker, color, (duration)] spawn BIS_fnc_changeColorMarker
	[marker, (duration), (finalAlpha)] spawn BIS_fnc_showMarker or BIS_fnc_showMarkerArray
	[marker, (duration)] spawn BIS_fnc_hideMarker or BIS_fnc_hideMarkerArray
	[marker, newPosition, (duration), (interpolationType)] call BIS_fnc_moveMarker
	[marker, (size), (duration)] spawn BIS_fnc_resizeMarker
	[marker, newAzimuth, (absoluteOrRelativ), (shortestTurn), (duraton)] spawn BIS_fnc_rotateMarker
	[area, center, (time), (handler), (forceCam)] call BIS_fnc_zoomOnArea
*/


// timeline of events
_timeline = [
	[0.0, {
		//leave a bit of delay for the map to open
	}],
	[1.0, { 
		// zoom on the general AO
		[markerSize "marker_briefing_zoom_1", markerPos "marker_briefing_zoom_1", 1] call BIS_fnc_zoomOnArea;
	}],
	[3.0, {
		// blink the HQ marker
		["marker_hq", 0.2, 2] spawn BIS_fnc_blinkMarker;
	}],
	[6.0, {
		//zoom on the specific AO
		[markerSize "marker_briefing_zoom_2", markerPos "marker_briefing_zoom_2", 1] call BIS_fnc_zoomOnArea;
	}],
	[8.0, {
		// show player where he is by blinking his squad marker
		["marker_alpha1_1", 0.2, 2] spawn BIS_fnc_blinkMarker;
	}],
	[12.0, {
		// move players squad marker to ambush position
		["marker_alpha1_1", markerpos "marker_move_1", 2] spawn BIS_fnc_moveMarker;
	}],
	[16.0, {
		// move second BLUFOR group's marker to enemy
		["marker_alpha1_2", markerpos "marker_briefing_zoom_2", 5] spawn BIS_fnc_moveMarker;
	}],
	[18.0, {
		// reveal ambush marker
		["marker_fire", 1] spawn BIS_fnc_showMarker;
	}],
	[22.0, {
		// show enemies squad eliminated
		["marker_enemySquad", 2, 1] spawn BIS_fnc_cancelMarker;
	}],
	[24.0, {
		// grey out enemy squad marker
		["marker_enemySquad", "ColorGrey", 1] spawn BIS_fnc_changeColorMarker;
	}],
	[29.0, {
		
	}]
];

_music = ""; //CfgMusic to play
_markersHide = ["marker_fire"]; //array of markers which should be hidden when briefing starts
_markersShow = []; //array of markers which should be shown when the briefing is done
_endPosition = "marker_briefing_zoom_2"; //marker to focus when the briefing is done
// play the animated briefing
[_timeline, 0, _music, _markersHide, _markersShow, _endPosition] call BIS_fnc_animatedBriefing;

//wait until breifing is done and map is closed
waitUntil { !(missionNamespace getVariable ["BIS_fnc_eventTimeline_playing",true]) && !visibleMap };

//global var to start attack
AAS_animatedBriefingDone = true;

//optional: reset markers
"marker_alpha1_1" setMarkerpos leader B_grpInf_1;
"marker_alpha1_2" setMarkerPos leader B_grpInf_2;
"marker_enemySquad" setMarkerColor "colorIndependent";