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
#	"kola": preload("res://assets/puzzle_images/bananas.png"),
#	"tometou": preload("res://assets/puzzle_images/tomato.png"),
#	"goru": preload("res://assets/puzzle_images/cow.png"),
	"beg": preload("res://assets/puzzle_images/bag.png"),
#	"kachamorich": preload("res://assets/puzzle_images/green chillies.png"),
##	"peepe": preload("res://assets/puzzle_images/papaya.png"),
#	"aguunoo": preload("res://assets/puzzle_images/fire.png"),
#	"bagarro": preload("res://assets/puzzle_images/burger.png"),
#	"balb": preload("res://assets/puzzle_images/bulb.png"),
#	"ddoroja": preload("res://assets/puzzle_images/door.png"),
##	"licu": preload(),
#	"tiya": preload("res://assets/puzzle_images/tia_bird.png"),
##	"coroui": preload(),
#	"gajoro": preload("res://assets/puzzle_images/carrot.png"),
#	"komola": preload("res://assets/puzzle_images/orange.png"),
#	"kolomo": preload("res://assets/puzzle_images/pen.png"),
#	"kolo": preload("res://assets/puzzle_images/tube_well.png"),
#	"bolo": preload("res://assets/puzzle_images/Bol.png"),
#	"biralo":preload("res://assets/puzzle_images/Cat.png"),
#
#
}
#
#var letter_images = {
#	"ko": preload("res://assets/letters/ko.png"),
#	"la": preload("res://assets/letters/la.png")
#}

var keyboard_letters = {
	"a": preload("res://assets/keyboard_letters/a.png"),
	"b": preload("res://assets/keyboard_letters/b.png"),
	"ba": preload("res://assets/keyboard_letters/ba.png"),
	"be": preload("res://assets/keyboard_letters/be.png"),
	"bi": preload("res://assets/keyboard_letters/bi.png"),
	"c": preload("res://assets/keyboard_letters/c.png"),
	"ca": preload("res://assets/keyboard_letters/ca.png"),
	"cha": preload("res://assets/keyboard_letters/cha.png"),
	"cu": preload("res://assets/keyboard_letters/cu.png"),
	"d": preload("res://assets/keyboard_letters/d.png"),
	"dh": preload("res://assets/keyboard_letters/dh.png"),
	"dhi": preload("res://assets/keyboard_letters/dhi.png"),
	"e": preload("res://assets/keyboard_letters/e.png"),
	"g": preload("res://assets/keyboard_letters/g.png"),
	"ga": preload("res://assets/keyboard_letters/ga.png"),
	"gh": preload("res://assets/keyboard_letters/gh.png"),
	"kaa":preload("res://assets/keyboard_letters/gu.png"),
	"ha":preload("res://assets/keyboard_letters/ha.png"),
	"i": preload ("res://assets/keyboard_letters/i.png"),
	"j": preload("res://assets/keyboard_letters/j.png"),
	"ja": preload("res://assets/keyboard_letters/ja.png"),
	"k": preload("res://assets/keyboard_letters/k.png"),
	"ka": preload("res://assets/keyboard_letters/ka.png"),
	"ka6": preload("res://assets/keyboard_letters/ka6.png"),
	"ke": preload("res://assets/keyboard_letters/ke.png"),
	"kh": preload("res://assets/keyboard_letters/kh.png"),
	"kka": preload("res://assets/keyboard_letters/kka.png"),
	"ks": preload("res://assets/keyboard_letters/ks.png"),
	"l": preload("res://assets/keyboard_letters/l.png"),
	"la": preload("res://assets/keyboard_letters/la.png"),
	"lb": preload("res://assets/keyboard_letters/lb.png"),
	"li": preload("res://assets/keyboard_letters/li.png"),
	"lp": preload("res://assets/keyboard_letters/lp.png"),
	"m": preload("res://assets/keyboard_letters/m.png"),
	"ma": preload("res://assets/keyboard_letters/ma.png"),
	"me": preload("res://assets/keyboard_letters/me.png"),
	"n": preload("res://assets/keyboard_letters/n.png"),
	"na": preload("res://assets/keyboard_letters/na.png"),
	"ne": preload("res://assets/keyboard_letters/ne.png"),
	"ng": preload("res://assets/keyboard_letters/ng.png"),
#	"pe": preload("res://assets/keyboard_letters/pe.png"),
	"O": preload("res://assets/keyboard_letters/O.png"),
	"OU": preload("res://assets/keyboard_letters/OU.png"),
	"p": preload("res://assets/keyboard_letters/p.png"),
	"pa": preload("res://assets/keyboard_letters/pa.png"),
	"pe": preload("res://assets/keyboard_letters/pe.png"),
	"pe6": preload("res://assets/keyboard_letters/pe6.png"),
	"r": preload("res://assets/keyboard_letters/r.png"),
	"ra": preload("res://assets/keyboard_letters/ra.png"),
	"re": preload("res://assets/keyboard_letters/re.png"),
	"ri": preload("res://assets/keyboard_letters/ri.png"),
	"Rra": preload("res://assets/keyboard_letters/Rra.png"),
	"rrga": preload("res://assets/keyboard_letters/rrga.png"),
	"Rri": preload("res://assets/keyboard_letters/Rri.png"),
	"ru": preload("res://assets/keyboard_letters/ru.png"),
	"s": preload("res://assets/keyboard_letters/s.png"),
	"sa": preload("res://assets/keyboard_letters/sa.png"),
	"shi": preload("res://assets/keyboard_letters/shi.png"),
	"si": preload("res://assets/keyboard_letters/si.png"),
	"su": preload("res://assets/keyboard_letters/su.png"),
	"T": preload("res://assets/keyboard_letters/T.png"),
	"te": preload("res://assets/keyboard_letters/te.png"),
	"ti": preload("res://assets/keyboard_letters/ti.png"),
	"to": preload("res://assets/keyboard_letters/To.png"),
	"Tte": preload("res://assets/keyboard_letters/Tte.png"),
	"u": preload("res://assets/keyboard_letters/u.png"),
	"y": preload("res://assets/keyboard_letters/y.png"),
	"ya": preload("res://assets/keyboard_letters/ya.png"),
	
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
#	"bolo":{
#		"spelling":["bo","lo"],
#		"keyboard":["go","no", "cha", "lo","cho","ba", "bo", "ga","mo","na"]
#	},
#	"biralo":{
#		"spelling":["ba", "ra", "lo"],
#		"keyboard":["go","ra", "cha", "lo","cho","ddhi", "ba", "ga","mo","na"]
#	},
#
#	"goru":{
#		"spelling":["go", "ru",],
#		"keyboard":["go", "cha", "lo","cho","ba", "ru", "ba", "ga","mo","na"]
#	},
#
#	"tometou":{
#		"spelling":["to", "me", "tou"],
#		"keyboard":["go", "to", "lo","cho","me", "ra", "ba", "tou","mo","na"]
#	},
	
	"beg":{
		"spelling":["be", "g"],
		"keyboard":["Rri", "g","e","me", "pa", "be", "b","m","na", "re"]
	},
	
	
	
	
	
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

