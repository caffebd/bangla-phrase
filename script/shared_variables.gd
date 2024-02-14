extends Node

var rng : RandomNumberGenerator = RandomNumberGenerator.new()

var current_level = 0

var target_word: String = ""
var target_word_length: int = 0

var target_spelling: Array = []

var level_selected: int = 0

var all_keys_size: int = 0

var total_game_points: int = 0

var flashing_time: float = 0.4

var words_complete: int = 0

var total_seconds: int = 0

var last_game_points: int = 0

func _ready():
	rng.randomize() 

	
var word_images = {
	"kola": preload("res://assets/puzzle_images/bananas.png"),
	"tometou": preload("res://assets/puzzle_images/tomato.png"),
	"goru": preload("res://assets/puzzle_images/cow.png"),
#	"baag": preload("res://assets/puzzle_images/bag.png"),
	"kachamorich": preload("res://assets/puzzle_images/green chillies.png"),
#	"peepe": preload("res://assets/puzzle_images/papaya.png"),
	"aguunoo": preload("res://assets/puzzle_images/fire.png"),
	"bagarro": preload("res://assets/puzzle_images/burger.png"),
	"balb": preload("res://assets/puzzle_images/bulb.png"),
	"ddoroja": preload("res://assets/puzzle_images/door.png"),
#	"licu": preload(),
	"tiya": preload("res://assets/puzzle_images/tia_bird.png"),
#	"coroui": preload(),
	"gajoro": preload("res://assets/puzzle_images/carrot.png"),
	"komola": preload("res://assets/puzzle_images/orange.png"),
	"kolomo": preload("res://assets/puzzle_images/pen.png"),
	"kolo": preload("res://assets/puzzle_images/tube_well.png"),
	"bolo": preload("res://assets/puzzle_images/Bol.png"),
	"biralo":preload("res://assets/puzzle_images/Cat.png"),
}
#
#var letter_images = {
#	"ko": preload("res://assets/letters/ko.png"),
#	"la": preload("res://assets/letters/la.png")
#}

var keyboard_letters = {
	"ko": preload("res://assets/keyboard_letters/ko.png"),
	"la": preload("res://assets/keyboard_letters/la.png"),
	"lo": preload("res://assets/keyboard_letters/lo.png"),
	"mo": preload("res://assets/keyboard_letters/mo.png"),
	"na": preload("res://assets/keyboard_letters/na.png"),
	"go": preload("res://assets/keyboard_letters/go.png"),
	"no": preload("res://assets/keyboard_letters/no.png"),
	"ba": preload("res://assets/keyboard_letters/ba.png"),
	"bo": preload("res://assets/keyboard_letters/bo.png"),
	"ga": preload("res://assets/keyboard_letters/ga.png"),
	"to": preload("res://assets/keyboard_letters/to.png"),
	"me": preload("res://assets/keyboard_letters/me.png"),
	"tou": preload("res://assets/keyboard_letters/tou.png"),
	"i": preload("res://assets/keyboard_letters/i.png"),
	"ru": preload("res://assets/keyboard_letters/ru.png"),
	"kaa":preload("res://assets/keyboard_letters/kaa.png"),
	"cha":preload("res://assets/keyboard_letters/ca.png"),
	"ri": preload ("res://assets/keyboard_letters/ri.png"),
	"cho": preload("res://assets/keyboard_letters/cho.png"),
	"sho": preload("res://assets/keyboard_letters/sho.png"),
	"te": preload("res://assets/keyboard_letters/te.png"),
	"rri": preload("res://assets/keyboard_letters/rri.png"),
	"o": preload("res://assets/keyboard_letters/o.png"),
	"pee": preload("res://assets/keyboard_letters/pe.png"),
	"oo": preload("res://assets/keyboard_letters/oo.png"),
	"gho": preload("res://assets/keyboard_letters/gho.png"),
	"guu": preload("res://assets/keyboard_letters/guu.png"),
	"ddo": preload("res://assets/keyboard_letters/do.png"),
	"ddho": preload("res://assets/keyboard_letters/dho.png"),
	"ddhi": preload("res://assets/keyboard_letters/ddhi.png"),
	"nne": preload("res://assets/keyboard_letters/nne.png"),
	"sha": preload("res://assets/keyboard_letters/sha.png"),
	"ja": preload("res://assets/keyboard_letters/ja.png"),
	"jo": preload("res://assets/keyboard_letters/jo.png"),
	"ke": preload("res://assets/keyboard_letters/ke.png"),
	"kho": preload("res://assets/keyboard_letters/kho.png"),
	"kka": preload("res://assets/keyboard_letters/kka.png"),
	"lb": preload("res://assets/keyboard_letters/lb.png"),
	"pa": preload("res://assets/keyboard_letters/pa.png"),
#	"pe": preload("res://assets/keyboard_letters/pe.png"),
	"po": preload("res://assets/keyboard_letters/po.png"),
	"ra": preload("res://assets/keyboard_letters/ra.png"),
	"re": preload("res://assets/keyboard_letters/re.png"),
	"ya": preload("res://assets/keyboard_letters/ya.png"),
	"yo": preload("res://assets/keyboard_letters/yo.png"),
	"soou": preload("res://assets/keyboard_letters/su.png"),
	"co": preload("res://assets/keyboard_letters/co.png"),
	"ng": preload("res://assets/keyboard_letters/ng.png"),
	"rou": preload("res://assets/keyboard_letters/ru.png"),
	"a": preload("res://assets/keyboard_letters/a.png"),
	"ca": preload("res://assets/keyboard_letters/ca.png"),
	"ti": preload("res://assets/keyboard_letters/ti.png"),
	"nni": preload("res://assets/keyboard_letters/ni.png"),
	"cu": preload("res://assets/keyboard_letters/chu.png"),
	"tte": preload("res://assets/keyboard_letters/te.png"),
	"ka": preload("res://assets/keyboard_letters/ka.png"),
	"li": preload("res://assets/keyboard_letters/li.png"),
	"so": preload("res://assets/keyboard_letters/so.png"),
	"ha": preload("res://assets/keyboard_letters/ha.png"),
	"ro": preload("res://assets/keyboard_letters/ro.png"),
	"ma": preload("res://assets/keyboard_letters/ma.png"),
#	"yo": preload(),
#	"yo": preload(),
#	60 letters "":preload()
}

# lbe to lb 
#sho so (same image) rga?? su te/tte ?
#missing gar (burger)
#pee if ok but pe missing
# noo is missing (different to no?) 

var test_levels = {
	"bolo":{
		"spelling":["bo","lo"],
		"keyboard":["go","no", "cha", "lo","cho","ba", "bo", "ga","mo","na"]
	},
	"biralo":{
		"spelling":["ba", "ra", "lo"],
		"keyboard":["go","ra", "cha", "lo","cho","ba", "ba", "ga","mo","na"]
	}
	
	
#
#		"kachamorich":{
#		"spelling":["kaa","cha","*","mo","ri","cho"],
#		"keyboard":["mo","la","na","ri","kaa","lo","go","no", "cha", "cho"]
#		},
#
#	"kola":{
#		"spelling":["ko","la"],
#		"keyboard":["bo","la","mo","na","ko","lo","go","no", "ba", "ga"]
#		},
}

var easy_levels =  {
	"kachamorich":{
		"spelling":["kaa","cha","*","mo","ri","cho"],
		"keyboard":["mo","la","na","ri","kaa","lo","go","no", "cha", "cho"]
		},
  
	"kola":{
		"spelling":["ko","la"],
		"keyboard":["bo","la","mo","na","ko","lo","go","no", "ba", "ga"]
		},
  
	"goru":{
		"spelling":["go","ru"],
		"keyboard":["go","ru","i","la","go","mo","na","me","tou",  "ga"]
		},
  
	"tometou":{
		"spelling":["to","me", "tou"], 
		"keyboard":["to","la","sho","ko","o","me","gho","nne", "ddhi", "tou"]
		},
				

   "balb":{
		"spelling":["ba","lb"], 
		"keyboard":["oo","i","ti","ko","bo","te","so","lb", "lo", "ba"]
		},	

   "ddoroja":{
		"spelling":["ddo","ro", "ja"], 
		"keyboard":["ro","rri","mo","yo","ddo","ma","lo","ja", "ga", "la"]
		},	

	
   "tiya":{
		"spelling":["ti","ya"], 
		"keyboard":["ke","po","ddho","ya","to","kka","soou","ti", "ka", "no"]
		},	

   "gajoro":{
		"spelling":["ga","jo", "ro"], 
		"keyboard":["cho","ng","ga","a","ca","rri","ro","go", "ka", "jo"]
		},	
# Luke did
"komola":{
		"spelling":["ko","mo", "la"], 
		"keyboard":["to","la","sho","ko","ga","me","gho","nne", "mo", "ru"]
		},
  "kolomo":{
		"spelling":["ko","lo", "mo"], 
		"keyboard":["to","la","sho","ko","ga","me","mo","nne", "ka", "lo"]
		},
  "kolo":{
		"spelling":["ko","lo"], 
		"keyboard":["to","la","ko","ro","ga","me","mo","nne", "ka", "lo"]
		},
		

#  "peepe":{
#		"spelling":["pee","pe"], 
#		"keyboard":["pee","sha","ya","ra","pe","to","re","ko", "la", "ca"]
#		},	

#  "aguunoo":{
#		"spelling":["a","guu", "noo"], 
#		"keyboard":["a","ka","li","guu","na","ha","kho","ro", "noo", "so"]
#		},	


#   "bagarro":{
#		"spelling":["ba","gar", "ro"], 
#		"keyboard":["rri","ga","gar","ng","so","ba","ro","no", "ko", "la"]
#		},

#	"baag":{
#		"spelling":["baa","go"],
#		"keyboard":["i","la","go","na","na","me","go","baa", "ru", "ga"]
#		},

#   "coroui":{
#		"spelling":["co","rou", "i"], 
#		"keyboard":["ma","sho","co","li","to","rou","la","ko", "i", "lo"]
#		},	

#   "licu":{
#		"spelling":["li","cu"], 
#		"keyboard":["rri","nni","li","lo","ko","pa","cu","tte", "la", "lo"]
#		},		
				
	} 


	
#var all_levels = [easy_levels]
var all_levels = [test_levels]
var playing_levels = []

func reset_levels():
	playing_levels = all_levels[level_selected].duplicate()
	var all_keys = playing_levels.keys()
	all_keys_size = all_keys.size()
	total_game_points = 0
	words_complete = 0


func get_random_easy_level()-> String:
	var all_keys = playing_levels.keys()
	all_keys_size = all_keys.size()
	print ("start rand "+str(all_keys_size))
	var ind = rng.randi_range (0,all_keys_size-1)
	var picked_key = all_keys[ind]
	print (picked_key)
	playing_levels.erase(picked_key)
	all_keys_size = all_keys_size - 1		
	return picked_key

