
function DarkShaman(svg)
{
    function moveSprite(sprite, pos)
    {
	sprite.setAttribute("transform", "translate("+pos[0]+", "+ pos[1]+")");

    }

    function updateState()
    {
	dx = this.tank_pos[0] - this.boss_pos[0];
	dy = this.tank_pos[1] - this.boss_pos[1];

	dist = Math.sqrt(dx*dx+dy*dy);

	adjust = 100/dist;

	if (adjust<1) {
	    this.boss_pos = [ this.tank_pos[0] - dx*adjust,
			      this.tank_pos[1] - dy*adjust ];
	}

	adjust2 = 150/dist;

	dx2 = adjust2*dy;
	dy2 = -adjust2*dx;
	this.ashenWallPos = [ this.tank_pos[0] +dx2, this.tank_pos[1]+dy2,
			      this.tank_pos[0] -dx2, this.tank_pos[1]-dy2 ]
    }

    function  handleMouseMove(evt)
    {
	if (0) {
	    debug = document.getElementById("debug");
	    debug.innerHTML = "blargh "+evt.clientX+", "+evt.clientY;
	}

	mobs = this.svg.getElementById("mobs")

	this.tank_pos =[ evt.clientX*this.uiScale, 
			 evt.clientY*this.uiScale]

	this.updateState();

	moveSprite(this.boss_mob, this.boss_pos);

	moveSprite(this.tank, this.tank_pos);
	awp = this.ashenWallPos;
	this.ashenWall.setAttributeNS(null, "d", "M "+awp[0]+","+awp[1]+"  "+awp[2]+","+awp[3]);
    }

    //

    this.moveSprite = moveSprite
    this.updateState = updateState
    this.handleMouseMove = handleMouseMove

    this.svg = svg;

    xlinkNS = "http://www.w3.org/1999/xlink";
    mobs = this.svg.getElementById("mobs");

    if (1) {
	this.boss_mob = this.svg.createElementNS(svg.rootElement.namespaceURI, "use");
	this.boss_mob.setAttributeNS(xlinkNS, "href", "#boss_icon");
	this.boss_mob.setAttributeNS(null, "width", "600");
	this.boss_mob.setAttributeNS(null, "height", "600");
	mobs.appendChild(this.boss_mob)

    } else {
	this.boss_mob= this.svg.getElementById("boss_clone");
    }
    if (1) {
	this.tank = this.svg.createElementNS(svg.rootElement.namespaceURI, "use");
	this.tank.setAttributeNS(xlinkNS, "href", "#tank_icon");
	mobs.appendChild(this.tank)
    } else {
    this.tank = this.svg.getElementById("tank_clone");
    }
    if (1) {
	this.ashenWall = 
	    //document
	    this.svg
	    .createElementNS(svg.rootElement.namespaceURI, "path");
	this.ashenWall.setAttributeNS(null, "stroke", "rgb(255,0,0)");
	this.ashenWall.setAttributeNS(null, "stroke-width", "20px");
	this.ashenWall.setAttributeNS(null, "fill", "none");
	this.ashenWall.setAttributeNS(null, "opacity", "1");
	this.ashenWall.setAttributeNS(null, "stroke-opacity", "1");
	this.ashenWall.setAttributeNS(null, "x", "0");
	this.ashenWall.setAttributeNS(null, "y", "0");
	this.ashenWall.setAttributeNS(null, "pointer-events", "none");
	mobs.insertBefore(this.ashenWall, mobs.firstChild);
    } else {
	this.ashenWall = this.svg.getElementById("wall")
    }

    this.boss_pos = [300,300];
    this.tank_pos = [300,300];

    self = this
    circle = svg.getElementById("arena");
    circle.onmousemove = function(evt) { self.handleMouseMove(evt); };

}


window.onload = function() {

    //document
    svg = document.getElementById("svg")
	.getSVGDocument();
    ds = new DarkShaman(svg)
    ds.uiScale = 1
}
