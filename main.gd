extends Node2D
export (PackedScene) var enimy
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var cnt=0
func _ready():
	$Timer.start()
	cnt=0
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Timer_timeout():
	var enimytmp = enimy.instance()
	enimytmp.position= Vector2(0,0)
	add_child(enimytmp)
	cnt+=1
	print(cnt)
	$Timer.start()
