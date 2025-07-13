extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game


func show_message(text):
    #print("Entered show_message with text = %s" % text)
    $Message.text = text
    $Message.show()
    $MessageTimer.start()
    #print("Exiting show_message")

func show_game_over():
    #print("Entered show_game_over")
    show_message("Game Over")
    # Wait until the MessageTimer has counted down.
    #print("awaiting MessageTimer")
    await $MessageTimer.timeout
    #print("Game over message timed out")
    $Message.text = "Dodge the Creeps!"
    $Message.show()
    # Make a one-shot timer and wait for it to finish.
    await get_tree().create_timer(1.0).timeout
    #print("Created timer finished, showing start button")
    $StartButton.show()
    #print("Exiting show_game_over")

func update_score(score):
    $ScoreLabel.text = str(score)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
    pass

func _on_start_button_pressed():
    $StartButton.hide()
    start_game.emit()

func _on_message_timer_timeout():
    #print("Message timer timed out, hiding message.")
    $Message.hide()
