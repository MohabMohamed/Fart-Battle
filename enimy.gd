extends KinematicBody2D


export (int) var hit_power
export (int) var speed
var ScreenSize
var velocity =Vector2() 
var player_pos =Vector2()
var D=1.0
var player
var is_punching =false
func _ready():
	ScreenSize = get_viewport_rect().size
	player= get_tree().get_current_scene().get_node("player")
#_process(delta)

func hit():
	#if(is_punching) :
	#	return
	$AnimatedSprite.animation = "punch"
	#var is_punching =true




func _process(delta):
	player= get_tree().get_current_scene().get_node("player")
	player_pos = player.position
	velocity = Vector2() 
	if abs(player_pos.x-position.x)<100:
		hit()
	else :
		$AnimatedSprite.animation="walk"
	if player_pos.x<position.x:
		velocity.x-=1
		$AnimatedSprite.flip_h = false
	if player_pos.y<position.y:
		velocity.y-=1
	if player_pos.x>position.x:
		velocity.x+=1
		$AnimatedSprite.flip_h = true
	if player_pos.y>position.y:
		velocity.y+=1
	if velocity.length() >0:
		velocity=velocity.normalized()*speed
		position +=velocity*delta
	position.x =clamp(position.x,0,(ScreenSize.x)-40)
	position.y=clamp(position.y,545,(ScreenSize.y)-100)