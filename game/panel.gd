extends Panel

@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var panel: Panel = $"."


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player2D:
		panel.visible = true
		rich_text_label.visible = true
