extends Control

const NotificationScene = preload("res://utils/notification/Notification.tscn")
var notifications = []

func _ready() -> void:
	push_notif("Hello You", "bruh\toujours plus de lignes", "res://Assets/dino1.png")

func push_notif(_title: String, _description: String, _icon: String) -> void:
	var notif = NotificationScene.instantiate()

	var title = notif.get_node("MarginContainer/HorizontalLayout/TextLayout/Title")
	title.text = _title

	var description = notif.get_node("MarginContainer/HorizontalLayout/TextLayout/Description")
	description.text = _description

	var icon = notif.get_node("MarginContainer/HorizontalLayout/Icon")
	icon.texture = load(_icon)
	
	self.add_child(notif)
	$NotificationFadeout.start()

func _on_notification_fadeout_timeout() -> void:
	var notif = self.get_child(1)
	notif.queue_free()
