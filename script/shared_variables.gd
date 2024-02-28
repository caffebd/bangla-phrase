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
	# easy levels-----------
	"bl": preload("res://assets/puzzle_images/Bol.png"),
	"apel": preload("res://assets/puzzle_images/apple.png"),
	"beg": preload("res://assets/puzzle_images/bag.png"),
	"shim": preload("res://assets/puzzle_images/bean.png"),
	"kla": preload("res://assets/puzzle_images/bananas.png"),
	"bichana": preload("res://assets/puzzle_images/bed.png"),
	"baks": preload("res://assets/puzzle_images/box.png"),
	"balti": preload("res://assets/puzzle_images/bucket_2.png"),
	"ghRri": preload("res://assets/puzzle_images/Clock.png"),
	"Dab": preload("res://assets/puzzle_images/Coconut.png"),
	"gru": preload("res://assets/puzzle_images/cow.png"),
	"hriNn": preload("res://assets/puzzle_images/Deer.png"),
	"Desk": preload("res://assets/puzzle_images/desk.png"),
	"Dim": preload("res://assets/puzzle_images/Egg.png"),
	"ghr": preload("res://assets/puzzle_images/Home.png"),
	"jg": preload("res://assets/puzzle_images/jug.png"),
	"am": preload("res://assets/puzzle_images/mango.png"),
	"pleTt": preload("res://assets/puzzle_images/plate.png"),
	"gach": preload("res://assets/puzzle_images/Tree.png"),
	"ckoleTt": preload("res://assets/puzzle_images/chocolate_2.png"),
	
	"blekboRD": preload("res://assets/puzzle_images/Blackboard.png"),
	"bi": preload("res://assets/puzzle_images/Book.png"),
	
	
	
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
	"ch": preload("res://assets/keyboard_letters/ch.png"),
	"cha": preload("res://assets/keyboard_letters/cha.png"),
	"cu": preload("res://assets/keyboard_letters/cu.png"),
	"d": preload("res://assets/keyboard_letters/d.png"),
	"Da": preload("res://assets/keyboard_letters/Da.png"),
	"De": preload("res://assets/keyboard_letters/De.png"),
	"dh": preload("res://assets/keyboard_letters/dh.png"),
	"dhi": preload("res://assets/keyboard_letters/dhi.png"),
	"Di": preload("res://assets/keyboard_letters/Di.png"),
	"e": preload("res://assets/keyboard_letters/e.png"),
	"g": preload("res://assets/keyboard_letters/g.png"),
	"ga": preload("res://assets/keyboard_letters/ga.png"),
	"gh": preload("res://assets/keyboard_letters/gh.png"),
	"gu":preload("res://assets/keyboard_letters/gu.png"),
	"h":preload("res://assets/keyboard_letters/h.png"),
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
	"ko": preload("res://assets/keyboard_letters/ko.png"),
	"ks": preload("res://assets/keyboard_letters/ks.png"),
	"l": preload("res://assets/keyboard_letters/l.png"),
	"la": preload("res://assets/keyboard_letters/la.png"),
	"lb": preload("res://assets/keyboard_letters/lb.png"),
	"le": preload("res://assets/keyboard_letters/le.png"),
	"li": preload("res://assets/keyboard_letters/li.png"),
	"lp": preload("res://assets/keyboard_letters/lp.png"),
	"m": preload("res://assets/keyboard_letters/m.png"),
	"ma": preload("res://assets/keyboard_letters/ma.png"),
	"me": preload("res://assets/keyboard_letters/me.png"),
	"n": preload("res://assets/keyboard_letters/n.png"),
	"na": preload("res://assets/keyboard_letters/na.png"),
	"ne": preload("res://assets/keyboard_letters/ne.png"),
	"ng": preload("res://assets/keyboard_letters/ng.png"),
	"ni":preload("res://assets/keyboard_letters/ni.png"),
	"Nn":preload("res://assets/keyboard_letters/Nn.png"),
	"O": preload("res://assets/keyboard_letters/O.png"),
	"OU": preload("res://assets/keyboard_letters/OU.png"),
	"p": preload("res://assets/keyboard_letters/p.png"),
	"pa": preload("res://assets/keyboard_letters/pa.png"),
	"pe6": preload("res://assets/keyboard_letters/pe6.png"),
	"pe": preload("res://assets/keyboard_letters/pe.png"),
	"ple": preload("res://assets/keyboard_letters/ple.png"),
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
	"sk": preload("res://assets/keyboard_letters/sk.png"),
	"su": preload("res://assets/keyboard_letters/su.png"),
	"Tt": preload("res://assets/keyboard_letters/Tt.png"),
	"te": preload("res://assets/keyboard_letters/te.png"),
	"ti": preload("res://assets/keyboard_letters/ti.png"),
	"Tte": preload("res://assets/keyboard_letters/Tte.png"),
	"Tto": preload("res://assets/keyboard_letters/Tto.png"),
	"u": preload("res://assets/keyboard_letters/u.png"),
	"y": preload("res://assets/keyboard_letters/y.png"),
	"ya": preload("res://assets/keyboard_letters/ya.png"),
	"ble": preload("res://assets/keyboard_letters/ble.png"),
	"bo": preload("res://assets/keyboard_letters/bo.png"),
	"ci": preload("res://assets/keyboard_letters/ci.png"),
	"DhO": preload("res://assets/keyboard_letters/DhO.png"),
	"f": preload("res://assets/keyboard_letters/f.png"),
	"fri": preload("res://assets/keyboard_letters/fri.png"),
	"fu": preload("res://assets/keyboard_letters/fu.png"),
	"gi": preload("res://assets/keyboard_letters/gi.png"),
	"ha6": preload("res://assets/keyboard_letters/ha6.png"),
	"Ii": preload("res://assets/keyboard_letters/Ii.png"),
	"ju": preload("res://assets/keyboard_letters/ju.png"),
	"kha": preload("res://assets/keyboard_letters/kha.png"),
	"llu": preload("res://assets/keyboard_letters/llu.png"),
	"mu": preload("res://assets/keyboard_letters/mu.png"),
	"pi": preload("res://assets/keyboard_letters/pi.png"),
	"pr": preload("res://assets/keyboard_letters/pr.png"),
	"RD": preload("res://assets/keyboard_letters/RD.png"),
	"rt": preload("res://assets/keyboard_letters/rt.png"),
	"rz": preload("res://assets/keyboard_letters/rz.png"),
	"sh": preload("res://assets/keyboard_letters/sh.png"),
	"sha": preload("res://assets/keyboard_letters/sha.png"),
	"so": preload("res://assets/keyboard_letters/so.png"),
	"Ssh": preload("res://assets/keyboard_letters/Ssh.png"),
	"sUu": preload("res://assets/keyboard_letters/sUu.png"),
	"t": preload("res://assets/keyboard_letters/t.png"),
	"ta": preload("res://assets/keyboard_letters/ta.png"),
	"ttt": preload("res://assets/keyboard_letters/ttt.png"),
	"va": preload("res://assets/keyboard_letters/va.png"),
	
	
	
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
	
#
#	"bl":{
#		"spelling":["b","l"],
#		"keyboard":["g","n", "ca", "l","cha","ba", "b", "m","n","s"]
#	},
#
#	"apel":{
#		"spelling":["a", "pe", "l"],
#		"keyboard":["be", "a", "kh", "i", "pe", "n", "g", "l", "cha", "c"]
#	},
#
#	"beg":{
#		"spelling":["be", "g"],
#		"keyboard":["Rri", "g","e","me", "pa", "be", "b","m","na", "re"]
#	},
#
#	"shim":{
#		"spelling":["shi", "m"],
#		"keyboard":["g","ra", "cha", "l","shi","rrga", "ba", "ga","m","na"]
#	},
#
#	"kla":{
#		"spelling":["k","la"],
#		"keyboard":["b","la","m","na","k","l","ga","n", "cha", "gh"]
#		},
#
#	"bichana":{
#		"spelling":["bi", "cha", "na"],
#		"keyboard":["ga","n", "bi", "gh","b","cha","m","kh","k","na"]
#	},
#
#	"baks":{
#		"spelling":["ba", "ks"],
#		"keyboard":["shi","rrga", "ba", "ga","m","ks","g","ra", "cha", "l",]
#	},
#
#	"balti":{
#		"spelling":["ba", "l", "ti"],
#		"keyboard":[ "bi", "ba","b","g","n","ti","m","kh","l","na"]
#	},
#
#	"ghRri":{
#		"spelling":["gh", "Rri"],
#		"keyboard":["g","ra", "cha", "l","shi","Rri", "ba", "gh","m","na"]
#	},
#
#	"Dab":{
#		"spelling":["Da", "b"],
#		"keyboard":["g","ra", "b", "l","shi","rrga", "Da", "ga","m","na"]
#	},
#
#	"gru":{
#		"spelling":["g","ru"],
#		"keyboard":["ma","ra", "cha", "l","ru","p", "ba", "g","m","na"]
#	},
#
#	"hriNn":{
#		"spelling":["h", "ri", "Nn"],
#		"keyboard":["ga","ri","m","na", "bi","h", "gh","b","k","Nn"]
#	},
#
#	"Desk":{
#		"spelling":["De", "sk"],
#		"keyboard":[ "l","shi", "sk", "Da", "ga","De","g","ra","m","na"]
#	},
#
#	"Dim":{
#		"spelling":["Di", "m"],
#		"keyboard":["na","h","g","m", "be", "Di","c","ks", "cha", "l",]
#	},
#
#	"ghr":{
#		"spelling":["gh", "r"],
#		"keyboard":[ "ga","cha","shi","r", "l","ba","gh", "ra","ks","g",]
#	},
#
#	"jg":{
#		"spelling":["j","g"],
#		"keyboard":[ "l","ma","ru","j","ra", "ba", "g", "cha","m","na"]
#	},
#
#	"am":{
#		"spelling":["a","m"],
#		"keyboard":["g", "l", "ca","a","cha","n", "b", "m","n","s"]
#	},
#
#	"pleTt":{
#		"spelling":["ple", "Tt"],
#		"keyboard":[ "b", "l","Tt","g","ra","ple", "Da", "ga","m","na"]
#	},
#
#	"gach":{
#		"spelling":["ga","ch"],
#		"keyboard":["p", "ba", "g","ma","ra", "ch", "l","ru","ga","na"]
#	},
#
#	"ckoleTt":{
#		"spelling":["c", "ko", "le", "Tt"],
#		"keyboard":["ga", "ko","m","c","b","k","Tt", "gh","le","Nn"]
#	},



	"blekboRD":{
		"spelling":["ble", "k", "bo", "RD",],
		"keyboard":["g","ra", "k", "l","ble","Rri", "bo", "gh","m","RD"]
	},
	
	
	"bi":{
		"spelling":["b", "i",],
		"keyboard":["g","ra", "cha", "b","shi","Rri", "i", "gh","m","na"]
	},

	

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
		"keyboard":["ro","Rri","mo","yo","ddo","ma","lo","ja", "ga", "la"]
		},	

	
   "tiya":{
		"spelling":["ti","ya"], 
		"keyboard":["ke","po","ddho","ya","to","kka","soou","ti", "ka", "no"]
		},	

   "gajoro":{
		"spelling":["ga","jo", "ro"], 
		"keyboard":["cho","ng","ga","a","ca","Rri","ro","go", "ka", "jo"]
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

