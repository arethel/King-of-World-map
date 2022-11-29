extends Camera

var pressed = false
var motionScale = 0.5
var zoomScale = 0.5

var screenDrag = false;

var Apressed = false;

var touchs_distance = 0

var touchs_coords = [Vector2(0,0),Vector2(0,0)]

func _input(event):
	
	if event is InputEventKey:
		if event.scancode == KEY_A:
			if(Apressed!=event.pressed&&event.pressed&&pressed):
				touchs_coords[0]=get_viewport().get_mouse_position()
				screenDrag=false;
			Apressed=event.pressed
			if(!Apressed):
				touchs_coords[0]=Vector2(0,0)
				touchs_coords[1]=Vector2(0,0)
				touchs_distance=0
	
	if event is InputEventMouseButton:
		if(!Apressed):
			if(event.button_index==1):
				screenDrag=true;
		else:
			if(pressed!=event.pressed&&event.pressed):
				touchs_coords[1]=get_viewport().get_mouse_position()
				touchs_distance=(touchs_coords[1]-touchs_coords[0]).length()
			screenDrag=false;
		pressed=event.pressed
	
	if event is InputEventMouseMotion:
		if(screenDrag&&pressed):
			var smoothed = lerp(Vector2(0,0),event.relative,motionScale/50);
			transform.origin-=Vector3(smoothed.x,0,smoothed.y);
		if(pressed&&touchs_distance!=0):
			touchs_coords[1]=get_viewport().get_mouse_position()
			var n_touchs_distance=(touchs_coords[1]-touchs_coords[0]).length()
			var differOfDist = n_touchs_distance-touchs_distance
			touchs_distance=n_touchs_distance
			var kY = -sin(rotation_degrees.x*PI/180)
			var kZ = cos(rotation_degrees.x*PI/180)
			var smoothed = lerp(Vector2(0,0),Vector2(kY,kZ),zoomScale/10);
			transform.origin-=differOfDist*Vector3(0,smoothed.x,smoothed.y);
