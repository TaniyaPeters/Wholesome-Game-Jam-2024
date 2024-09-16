extends Panel

@onready var panel_2: Panel = $"."
@onready var rich_text_label: RichTextLabel = $RichTextLabel


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player2D:
		panel_2.visible = true
		rich_text_label.visible = true
