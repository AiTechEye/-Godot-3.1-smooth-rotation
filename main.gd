extends Spatial

var direction = Vector3()

func rotating(dir):
#calculate the rotation
	var a  = atan2(dir.x* -1, dir.z* -1)
#calculate steps from rotation to rotation using lerp
	var rot = $player.get_rotation()
	if abs(rot.y-a) > PI:
		var m = PI * 2
		var d = fmod(a-rot.y,m)
		a = rot.y + (fmod(2 * d,m)-d)*0.2
	else:
		a = lerp(rot.y,a,0.1)
	$player.rotation.y = a


func _process(delta):
	direction = Vector3()
	var move = false
	if Input.is_key_pressed(KEY_W):
		direction.z = -1
		move = true
	if Input.is_key_pressed(KEY_S):
		direction.z = 1
		move = true
	if Input.is_key_pressed(KEY_A):
		direction.x = -1
		move = true
	if Input.is_key_pressed(KEY_D):
		direction.x = 1
		move = true
	if move:
		rotating(direction)
	direction = direction.normalized()
	$player.move_and_slide(direction,Vector3(0,1,0))
