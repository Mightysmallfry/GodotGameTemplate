extends Area2D

@export var spring_strength:float = 600.0

func _on_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		$AnimatedSprite2D.play()
		body.velocity.y -= spring_strength


func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.frame = 0
