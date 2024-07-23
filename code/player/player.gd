class_name PlayerController extends Entity

func _aim_at_point():
	var camera = get_viewport().get_camera_3d()
	var mouse_coords = get_viewport().get_mouse_position()
	var facing_direction = camera.project_ray_normal(mouse_coords)
	var perspective_scale = -camera.project_ray_origin(mouse_coords).y / facing_direction.y
	var final_location = camera.position + perspective_scale*facing_direction
	
	return Vector2(final_location.x, final_location.z)

func _physics_process(_delta):
	move_and_slide()
