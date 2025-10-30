extends Node2D

@onready var game_viewport_container : SubViewportContainer = $SubViewportContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.GameViewportContainer = game_viewport_container


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
