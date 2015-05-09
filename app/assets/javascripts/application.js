/*
 * Here contains the animation code for the walker and the auto positioning
 * of the background image.
 * Referred to the following website for javascript animation:
 * http://www.schillmania.com/content/projects/javascript-animation-1/
 */

var OFFSET = 20;
var walker = null;
var header= null;
var doge = null;
var time = 0;
var from = 0;
var to = 60;
var step = 60;
var frames = [];
var trembleStep = 0;

/*
 * Move the walker forward by one step, and prepare for the next step afterwards.
 */
function moveWalker() {
	if (time < frames.length) {
		walker.style.left = frames[time]+'px';
		time++;
		setTimeout(moveWalker,30);
	}
	else {
		time = 0;
		from = parseInt(walker.style.left);
		if ((from + step > window.innerWidth && step > 0) || (from + step < 0 && step < 0)) {
			step = -step;
			walker.style.transform = step < 0 ? "scaleX(-1)" : "scaleX(1)";
		}
		to = from + step;
		setTimeout(makeSteps, 0);
	}
}

/*
 * Autocalculate the header's position
 */
function positionHeader() {
    header.style.left = (window.innerWidth - 1656)/2 + 'px';
}

/*
 * Get the walker busy and keep making steps.
 */
function makeSteps() {
	var animDelta = step;
	var tweenAmount = [5,5,5,5,6,6,7,8,9,10,11,12,13,14,15,14,13,12,11,10,9,8,7,6,6,5,5,5,5];
	var frameCount = tweenAmount.length;
	var newFrame = from;
	for (var i = 0; i < frameCount; i++) {
  		newFrame += (animDelta*tweenAmount[i]/247);
  		frames[i] = newFrame;
	}
	moveWalker();
}

function init() {
	walker = document.getElementById("walker");
	header = document.getElementById("header_bg");
	walker.onclick = function() {
		step = -step;
		walker.style.transform = step < 0 ? "scaleX(-1)" : "scaleX(1)";
	}
	doge = document.getElementById("doge");
	walker.style.left = '0px';
	walker.style.bottom = '-15px';
	makeSteps();
	positionHeader();
	if (doge != null)
		doge.onclick = function() {
			alert("Get Your Hand Off Me!!!");
		}
}

window.onload = init;
window.onresize = positionHeader;
