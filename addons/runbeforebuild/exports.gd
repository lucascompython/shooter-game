class_name Exports
## Command to execute when building for debug
@export var debug_cmd := "cargo build"
## Command to execute when exporting
@export var release_cmd := "cargo build --release"
@export var cwd := "./rust"



static func get_cmds() -> Array[String]:
	var resource := preload("res://addons/runbeforebuild/runbeforebuild.tres")
	return [resource.debug_cmd, resource.release_cmd, resource.cwd]


static func get_shell() -> String:
	var os := OS.get_name()
	var shell: String
	
	match os:
		"Windows", "UWP":
			shell = "powershell"
		"Linux", "FreeBSD", "NetBSD", "OpenBSD", "BSD", "macOS":
			shell = "bash"
		_:
			shell = "N/A" # basically don't support mobile
	return shell
