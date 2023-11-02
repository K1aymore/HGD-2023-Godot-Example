extends Label

var treatsEaten = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	updateLabel()



func updateLabel():
	text = "Treats: " + str(treatsEaten)



func _on_player_ate_treat() -> void:
	treatsEaten += 1
	updateLabel()
