extends SubViewportContainer

func _ready():
	resized.connect(_on_resized)
	_on_resized() # Call it once to set the initial size

func _on_resized():
	# Get the first SubViewport child
	var viewport = get_child(0) as SubViewport
	if viewport:
		# Set the viewport's size to the container's size
		viewport.size = size
