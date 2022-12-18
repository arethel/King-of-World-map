tool
extends MeshInstance


var zones = load("res://zones.png")

func _ready():
	pass

var pressed = false
func _on_StaticBody_input_event(_camera, event, position, _normal, _shape_idx):
	if(event is InputEventMouseButton):
		if(pressed!=event.pressed&&pressed==false):
			not_click=false
			last_motion = 0
			var norm_pos = normalize_coords(position)
			posOfClick=Vector2(norm_pos.x,norm_pos.z)
			get_tree().create_timer(0.35,true).connect("timeout",self,"set_not_click")
		if(pressed!=event.pressed&&pressed==true&&!not_click&&last_motion<30):
			get_parent().emit_signal("clickOnMap",posOfClick)
			var imgOfZones = zones.get_data()
			imgOfZones.lock()
			var clickZoneColor = imgOfZones.get_pixel(int(posOfClick.x),int(posOfClick.y))
			get_surface_material(0).set_shader_param("brightZone",Vector3(clickZoneColor.r,clickZoneColor.g,clickZoneColor.b))
			imgOfZones.unlock()
			posOfClick = Vector2(-1,-1)
		pressed=event.pressed
	if(event is InputEventMouseMotion):
		if pressed:
			last_motion+=event.relative.length()

var last_motion = 0
var posOfClick = Vector2(-1,-1)
var not_click=true
func set_not_click():
	not_click=true
	posOfClick = Vector2(-1,-1)

func normalize_coords(coords):
	return (coords+Vector3(10,10,10))
