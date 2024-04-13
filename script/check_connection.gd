extends Node


func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")

func check_connection():
	$HTTPRequest.request("https://www.google.com")

func _on_request_completed(result, response_code, headers, body):
#	var json = JSON.parse(body.get_string_from_utf8())
	print(result)
