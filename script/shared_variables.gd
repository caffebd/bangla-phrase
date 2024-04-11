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

var temp_number: int = 0

var selected_words:Array = []

func _ready():
	rng.randomize() 


var background_audio = {
	"track1": preload("res://assets/audio/music/music_track_1.mp3"),
	"track2": preload("res://assets/audio/music/music_track_2.mp3"),
	"track3": preload("res://assets/audio/music/music_track_3.mp3"),
}

var word_audio = {
	"bl": preload("res://assets/audio/words/bl.mp3"),
	"apel": preload("res://assets/audio/words/apel.mp3"),
	"baag": preload("res://assets/audio/words/beg.mp3"),
	"shim": preload("res://assets/audio/words/shim.mp3"),
	"kla": preload("res://assets/audio/words/kla.mp3"),
	"bichana": preload("res://assets/audio/words/bichana.mp3"),
	"baks": preload("res://assets/audio/words/baks.mp3"),
	"balti": preload("res://assets/audio/words/balti.mp3"),
	"ghrri": preload("res://assets/audio/words/ghrri.mp3"),
	"ddab": preload("res://assets/audio/words/dab.mp3"),
	"gru": preload("res://assets/audio/words/gru.mp3"),
	"hrinn": preload("res://assets/audio/words/hrinn.mp3"),
	"ttebil": preload("res://assets/audio/words/table.mp3"),
	"ddim": preload("res://assets/audio/words/dim.mp3"),
	"ghr": preload("res://assets/audio/words/ghr.mp3"),
	"jg": preload("res://assets/audio/words/jg.mp3"),
	"am": preload("res://assets/audio/words/am.mp3"),
	"thala": preload("res://assets/audio/words/thala.mp3"),
	"gach": preload("res://assets/audio/words/gach.mp3"),
	"ckolett": preload("res://assets/audio/words/ckolett.mp3"),
	"blekbord": preload("res://assets/audio/words/blekbord.mp3"),
	"bi": preload("res://assets/audio/words/bi.mp3"),
#	"pakha": preload("res://assets/audio/words/pakha.mp3"),
	"shiyal": preload("res://assets/audio/words/shiyal.mp3"),
	"frij": preload("res://assets/audio/words/frij.mp3"),
	"peyara": preload("res://assets/audio/words/peyara.mp3"),
	"murgi": preload("res://assets/audio/words/murgi.mp3"),
	"cabi": preload("res://assets/audio/words/cabi.mp3"),
	"tala": preload("res://assets/audio/words/tala.mp3"),
#	"maflar": preload("res://assets/audio/words/maflar.mp3"),
	"mg": preload("res://assets/audio/words/mg.mp3"),
	"lbn": preload("res://assets/audio/words/lbn.mp3"),
	"shart": preload("res://assets/audio/words/shart.mp3"),
	"juta": preload("res://assets/audio/words/juta.mp3"),
	"camc": preload("res://assets/audio/words/camc.mp3"),
#	"sofa": preload("res://assets/audio/words/sofa.mp3"),
#	"suic": preload("res://assets/audio/words/suic.mp3"),
	"tbla": preload("res://assets/audio/words/tbla.mp3"),
#	"capata": preload("res://assets/audio/words/ca.mp3"),
	"ttrak": preload("res://assets/audio/words/ttrak.mp3"),
	
	
	"valluk": preload("res://assets/audio/words/valluk.mp3"),
	"projapti": preload("res://assets/audio/words/projapti.mp3"),
	"botl": preload("res://assets/audio/words/botl.mp3"),
	"balb": preload("res://assets/audio/words/balb.mp3"),
	"barrgar": preload("res://assets/audio/words/bargar.mp3"),
	"garri": preload("res://assets/audio/words/gari.mp3"),
	"birral": preload("res://assets/audio/words/birral.mp3"),
	"fulkpi": preload("res://assets/audio/words/fulkpi.mp3"),
	"cshma": preload("res://assets/audio/words/cshma.mp3"),
	"ciruni": preload("res://assets/audio/words/ciruni.mp3"),
	"almari": preload("res://assets/audio/words/almari.mp3"),
	"drja": preload("res://assets/audio/words/drja.mp3"),
	"dhol": preload("res://assets/audio/words/dhol.mp3"),
	"ha6s": preload("res://assets/audio/words/ha6s.mp3"),
	"iigl": preload("res://assets/audio/words/iigl.mp3"),
	"hati": preload("res://assets/audio/words/hati.mp3"),
	"agun": preload("res://assets/audio/words/agun.mp3"),
	"chagl": preload("res://assets/audio/words/chagl.mp3"),
	"ousshdh": preload("res://assets/audio/words/ousshdh.mp3"),
	"banr": preload("res://assets/audio/words/banr.mp3"),
	
	"mshari": preload("res://assets/audio/words/mshari.mp3"),
	"kmla": preload("res://assets/audio/words/kmla.mp3"),
	"patil": preload("res://assets/audio/words/patil.mp3"),
#	"pitttja": preload("res://assets/audio/words/pitttja.mp3"),
	"jahaj": preload("res://assets/audio/words/jahaj.mp3"),
	"sap": preload("res://assets/audio/words/sap.mp3"),
	"suurzmukhii": preload("res://assets/audio/words/suurzmukhii.mp3"),
	"ttmetto": preload("res://assets/audio/words/ttmetto.mp3"),
	"chata": preload("res://assets/audio/words/chata.mp3"),
	"ceyar": preload("res://assets/audio/words/ceyar.mp3"),
	"ga6dha": preload("res://assets/audio/words/ga6dha.mp3"),
	
	"vat": preload("res://assets/audio/words/vat.mp3"),
	"ttelivishn": preload("res://assets/audio/words/ttelivishn.mp3"),
	"deyal": preload("res://assets/audio/words/deyal.mp3"),
	"suta": preload("res://assets/audio/words/suta.mp3"),
	"ghorra": preload("res://assets/audio/words/ghora.mp3"),
	"ka6tthal": preload("res://assets/audio/words/ka6tthal.mp3"),
	"gajr": preload("res://assets/audio/words/gajr.mp3"),
	"aiskrim": preload("res://assets/audio/words/aiskrim.mp3"),
#	"jaynamaj": preload("res://assets/audio/words/jaynamaj.mp3"),
	"ka6camric": preload("res://assets/audio/words/ka6camric.mp3"),
#	"istri": preload("res://assets/audio/words/istri.mp3"),
	"rajha6s": preload("res://assets/audio/words/rajha6s.mp3"),
	"lattim": preload("res://assets/audio/words/latim.mp3"),
	"singh": preload("res://assets/audio/words/singh.mp3"),
	"khata": preload("res://assets/audio/words/khata.mp3"),
	"pe6pe": preload("res://assets/audio/words/pe6pe.mp3"),
	"klm": preload("res://assets/audio/words/klm.mp3"),
	"ddalim": preload("res://assets/audio/words/ddalim.mp3"),
	"khrgosh": preload("res://assets/audio/words/khrgosh.mp3"),
	"ndii": preload("res://assets/audio/words/ndii.mp3"),
	"golap": preload("res://assets/audio/words/golap.mp3"),
	"dourrano": preload("res://assets/audio/words/dourrano.mp3"),
	"sharri": preload("res://assets/audio/words/sharri.mp3"),
	"cadr": preload("res://assets/audio/words/cadr.mp3"),
#	"besin": preload("res://assets/audio/words/besin.mp3"),
	"ttiya": preload("res://assets/audio/words/ttiya.mp3"),
	"ttiuboyel": preload("res://assets/audio/words/ttiuboyel.mp3"),
	"shapla": preload("res://assets/audio/words/shapla.mp3"),
	"tthelagarri": preload("res://assets/audio/words/tthelagarri.mp3"),
	"frring": preload("res://assets/audio/words/frring.mp3"),
	"machi": preload("res://assets/audio/words/machi.mp3"),
	"shhidminar": preload("res://assets/audio/words/shhidminar.mp3"),
	"janala": preload("res://assets/audio/words/janala.mp3"),
	"hiira": preload("res://assets/audio/words/hiira.mp3"),
	"mishtti": preload("res://assets/audio/words/mishtti.mp3"),
	"pawruti": preload("res://assets/audio/words/pawruti.mp3"),
	"pata": preload("res://assets/audio/words/pata.mp3"),
#	"maltta": preload("res://assets/audio/words/maltta.mp3"),
	"ga6da": preload("res://assets/audio/words/ga6da.mp3"),
	"ayna": preload("res://assets/audio/words/ayna.mp3"),
	"alu": preload("res://assets/audio/words/alu.mp3"),
#	"pakhi": preload("res://assets/audio/words/pakhi.mp3"),
#	"rekett": preload("res://assets/audio/words/rekett.mp3"),
	"kamranga": preload("res://assets/audio/words/kamranga.mp3"),

	"bri": preload("res://assets/audio/words/boroi.mp3"),
	"kukur": preload("res://assets/audio/words/kukur.mp3"),
	"mishttikumrra": preload("res://assets/audio/words/mistikumra.mp3"),
	"prrithibii": preload("res://assets/audio/words/prithibi.mp3"),
	"pukur": preload("res://assets/audio/words/pukur.mp3"),
	"tetul": preload("res://assets/audio/words/tetul.mp3"),
	
}

	
var word_images = {
	# easy levels-----------
	"bl": preload("res://assets/puzzle_images/bol.png"),
	"apel": preload("res://assets/puzzle_images/apple.png"),
	"baag": preload("res://assets/puzzle_images/bag.png"),
	"shim": preload("res://assets/puzzle_images/bean.png"),
	"kla": preload("res://assets/puzzle_images/bananas.png"),
	"bichana": preload("res://assets/puzzle_images/bed.png"),
	"baks": preload("res://assets/puzzle_images/box.png"),
	"balti": preload("res://assets/puzzle_images/bucket_2.png"),
	"ghrri": preload("res://assets/puzzle_images/clock.png"),
	"ddab": preload("res://assets/puzzle_images/coconut.png"),
	"gru": preload("res://assets/puzzle_images/cow.png"),
	"hrinn": preload("res://assets/puzzle_images/deer.png"),
	"ttebil": preload("res://assets/puzzle_images/desk.png"),
	"ddim": preload("res://assets/puzzle_images/egg.png"),
#	"capata": preload("res://assets/puzzle_images/tealeaf.png"),
	"ghr": preload("res://assets/puzzle_images/home.png"),
	"jg": preload("res://assets/puzzle_images/jug.png"),
	"am": preload("res://assets/puzzle_images/mango.png"),
	"thala": preload("res://assets/puzzle_images/plate.png"),
	"gach": preload("res://assets/puzzle_images/tree.png"),
	"ckolett": preload("res://assets/puzzle_images/chocolate_2.png"),
	"blekbord": preload("res://assets/puzzle_images/blackboard.png"),
	"bi": preload("res://assets/puzzle_images/book.png"),
#	"pakha": preload("res://assets/puzzle_images/fen.png"),
	"shiyal": preload("res://assets/puzzle_images/fox.png"),
	"frij": preload("res://assets/puzzle_images/fridge.png"),
	"peyara": preload("res://assets/puzzle_images/guavas.png"),
	"murgi": preload("res://assets/puzzle_images/hen.png"),
	"cabi": preload("res://assets/puzzle_images/key.png"),
	"tala": preload("res://assets/puzzle_images/lock.png"),
#	"maflar": preload("res://assets/puzzle_images/muffler.png"),
	"mg": preload("res://assets/puzzle_images/mug.png"),
	"lbn": preload("res://assets/puzzle_images/salt.png"),
	"shart": preload("res://assets/puzzle_images/shirt.png"),
	"juta": preload("res://assets/puzzle_images/shoes.png"),
	"camc": preload("res://assets/puzzle_images/spoon.png"),
#	"sofa": preload("res://assets/puzzle_images/sufa.png"),
#	"suic": preload("res://assets/puzzle_images/suich.png"),
	"tbla": preload("res://assets/puzzle_images/tabla.png"),
	"ca*pata": preload("res://assets/puzzle_images/tealeaf.png"),
	"ttrak": preload("res://assets/puzzle_images/truck.png"),
	
	
	"valluk": preload("res://assets/puzzle_images/baby_bear.png"),
	"projapti": preload("res://assets/puzzle_images/baterfly.png"),
	"botl": preload("res://assets/puzzle_images/bottle.png"),
	"balb": preload("res://assets/puzzle_images/bulb.png"),
	"barrgar": preload("res://assets/puzzle_images/burger.png"),
	"garri": preload("res://assets/puzzle_images/car.png"),
	"birral": preload("res://assets/puzzle_images/cat.png"),
	"fulkpi": preload("res://assets/puzzle_images/cauliflower.png"),
	"cshma": preload("res://assets/puzzle_images/chashma.png"),
	"ciruni": preload("res://assets/puzzle_images/comb.png"),
	"almari": preload("res://assets/puzzle_images/cupboard.png"),
	"drja": preload("res://assets/puzzle_images/door.png"),
	"dhol": preload("res://assets/puzzle_images/drum.png"),
	"ha6s": preload("res://assets/puzzle_images/duck.png"),
	"iigl": preload("res://assets/puzzle_images/eagle.png"),
	"hati": preload("res://assets/puzzle_images/elephant.png"),
	"agun": preload("res://assets/puzzle_images/fire.png"),
	"chagl": preload("res://assets/puzzle_images/goat.png"),
	"ousshdh": preload("res://assets/puzzle_images/medicine.png"),
	"banr": preload("res://assets/puzzle_images/monkey.png"),
	
	"mshari": preload("res://assets/puzzle_images/mosquito_net.png"),
	"kmla": preload("res://assets/puzzle_images/orange.png"),
	"patil": preload("res://assets/puzzle_images/patil.png"),
#	"pitttja": preload("res://assets/puzzle_images/pizza.png"),
	"jahaj": preload("res://assets/puzzle_images/ship.png"),
	"sap": preload("res://assets/puzzle_images/snake_2.png"),
	"suurzmukhii": preload("res://assets/puzzle_images/sunflower.png"),
	"ttmetto": preload("res://assets/puzzle_images/tomato.png"),
	"chata": preload("res://assets/puzzle_images/umbrella.png"),
	"ceyar": preload("res://assets/puzzle_images/chair.png"),
	"ga6dha": preload("res://assets/puzzle_images/marigold.png"),
	
	"vat": preload("res://assets/puzzle_images/vat.png"),
	"ttelivishn": preload("res://assets/puzzle_images/tv.png"),
	"deyal": preload("res://assets/puzzle_images/wall.png"),
	"suta": preload("res://assets/puzzle_images/yarn.png"),
	"ghorra": preload("res://assets/puzzle_images/horse.png"),
	"ka6tthal": preload("res://assets/puzzle_images/kathal.png"),
	"gajr": preload("res://assets/puzzle_images/carrot.png"),
	"aiskrim": preload("res://assets/puzzle_images/chocolate.png"),
#	"jaynamaj": preload("res://assets/puzzle_images/jainamaz.png"),
	"ka6camric": preload("res://assets/puzzle_images/greenchillies.png"),
#	"istri": preload("res://assets/puzzle_images/iron.png"),
	"rajha6s": preload("res://assets/puzzle_images/kingfisher.png"),
	"lattim": preload("res://assets/puzzle_images/latim.png"),
	"singh": preload("res://assets/puzzle_images/lion.png"),
	"khata": preload("res://assets/puzzle_images/noteBook.png"),
	"pe6pe": preload("res://assets/puzzle_images/papaya.png"),
	"klm": preload("res://assets/puzzle_images/pen.png"),
	"ddalim": preload("res://assets/puzzle_images/pomegranate.png"),
	"khrgosh": preload("res://assets/puzzle_images/rabbit.png"),
	"ndii": preload("res://assets/puzzle_images/river.png"),
	"golap": preload("res://assets/puzzle_images/rose.png"),
	"dourrano": preload("res://assets/puzzle_images/run.png"),
	"sharri": preload("res://assets/puzzle_images/sari.png"),
	"cadr": preload("res://assets/puzzle_images/sheet.png"),
#	"besin": preload("res://assets/puzzle_images/sink.png"),
	"ttiya": preload("res://assets/puzzle_images/tia_bird.png"),
	"ttiuboyel": preload("res://assets/puzzle_images/tube_well.png"),
	"shapla": preload("res://assets/puzzle_images/water_lily.png"),
	"tthelagarri": preload("res://assets/puzzle_images/wheelbarrow.png"),
	"frring": preload("res://assets/puzzle_images/dragon_fly.png"),
	"machi": preload("res://assets/puzzle_images/fly.png"),
	"shhidminar": preload("res://assets/puzzle_images/shohid_minar.png"),
	"janala": preload("res://assets/puzzle_images/window.png"),
	"hiira": preload("res://assets/puzzle_images/diamond.png"),
	"mishtti": preload("res://assets/puzzle_images/sweet.png"),
	"pawruti": preload("res://assets/puzzle_images/bread.png"),
	"pata": preload("res://assets/puzzle_images/betel_leaves.png"),
#	"maltta": preload("res://assets/puzzle_images/malta.png"),
	"ga6da": preload("res://assets/puzzle_images/marigold.png"),
	"ayna": preload("res://assets/puzzle_images/mirror.png"),
	"alu": preload("res://assets/puzzle_images/potatoes.png"),
#	"pakhi": preload("res://assets/puzzle_images/pakhi.png"),
#	"rekett": preload("res://assets/puzzle_images/raket.png"),
	"kamranga": preload("res://assets/puzzle_images/kamranga.png"),
	
	"bri": preload("res://assets/puzzle_images/boroi.png"),
	"kukur": preload("res://assets/puzzle_images/dog.png"),
	"mishttikumrra": preload("res://assets/puzzle_images/misti_kumra.png"),
	"prrithibii": preload("res://assets/puzzle_images/erth.png"),
	"pukur": preload("res://assets/puzzle_images/pukur.png"),
	"tetul": preload("res://assets/puzzle_images/tetul.png"),
	
	
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
	"baa": preload("res://assets/keyboard_letters/baa.png"),
	"be": preload("res://assets/keyboard_letters/be.png"),
	"bi": preload("res://assets/keyboard_letters/bi.png"),
	"ble": preload("res://assets/keyboard_letters/ble.png"),
	"bo": preload("res://assets/keyboard_letters/bo.png"),
	"c": preload("res://assets/keyboard_letters/c.png"),
	"ca": preload("res://assets/keyboard_letters/ca.png"),
	"ce": preload("res://assets/keyboard_letters/ce.png"),
	"ch": preload("res://assets/keyboard_letters/ch.png"),
	"cha": preload("res://assets/keyboard_letters/cha.png"),
	"cu": preload("res://assets/keyboard_letters/cu.png"),
	"d": preload("res://assets/keyboard_letters/d.png"),
	"da": preload("res://assets/keyboard_letters/da.png"),
	"dda": preload("res://assets/keyboard_letters/dda.png"),
	"de": preload("res://assets/keyboard_letters/de.png"),
	"dde": preload("res://assets/keyboard_letters/dde.png"),
	"dh": preload("res://assets/keyboard_letters/dh.png"),
	"dha": preload("res://assets/keyboard_letters/dha.png"),
	"dhi": preload("res://assets/keyboard_letters/dhi.png"),
	"ddi": preload("res://assets/keyboard_letters/ddi.png"),
	"e": preload("res://assets/keyboard_letters/e.png"),
	"g": preload("res://assets/keyboard_letters/g.png"),
	"ga": preload("res://assets/keyboard_letters/ga.png"),
	"ga6": preload("res://assets/keyboard_letters/ga6.png"),
	"gh": preload("res://assets/keyboard_letters/gh.png"),
	"gu":preload("res://assets/keyboard_letters/gu.png"),
	"h":preload("res://assets/keyboard_letters/h.png"),
	"ha":preload("res://assets/keyboard_letters/ha.png"),
	"i": preload ("res://assets/keyboard_letters/i.png"),
	"j": preload("res://assets/keyboard_letters/j.png"),
	"ja": preload("res://assets/keyboard_letters/ja.png"),
	"k": preload("res://assets/keyboard_letters/k.png"),
	"khi": preload("res://assets/keyboard_letters/khi.png"),
	"ka": preload("res://assets/keyboard_letters/ka.png"),
	"ka6": preload("res://assets/keyboard_letters/ka6.png"),
	"ke": preload("res://assets/keyboard_letters/ke.png"),
	"kh": preload("res://assets/keyboard_letters/kh.png"),
	"kha": preload("res://assets/keyboard_letters/kha.png"),
	"khii": preload("res://assets/keyboard_letters/khii.png"),
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
	"nn":preload("res://assets/keyboard_letters/nn.png"),
	"o": preload("res://assets/keyboard_letters/o.png"),
	"ou": preload("res://assets/keyboard_letters/ou.png"),
	"p": preload("res://assets/keyboard_letters/p.png"),
	"pu": preload("res://assets/keyboard_letters/pu.png"),
	"pa": preload("res://assets/keyboard_letters/pa.png"),
	"pe6": preload("res://assets/keyboard_letters/pe6.png"),
	"pe": preload("res://assets/keyboard_letters/pe.png"),
	"ple": preload("res://assets/keyboard_letters/ple.png"),
	"r": preload("res://assets/keyboard_letters/r.png"),
	"ra": preload("res://assets/keyboard_letters/ra.png"),
	"re": preload("res://assets/keyboard_letters/re.png"),
	"ri": preload("res://assets/keyboard_letters/ri.png"),
	"rra": preload("res://assets/keyboard_letters/rra.png"),
	"rrga": preload("res://assets/keyboard_letters/rrga.png"),
	"rri": preload("res://assets/keyboard_letters/rri.png"),
	"ru": preload("res://assets/keyboard_letters/ru.png"),
	"s": preload("res://assets/keyboard_letters/s.png"),
	"sa": preload("res://assets/keyboard_letters/sa.png"),
	"shi": preload("res://assets/keyboard_letters/shi.png"),
	"si": preload("res://assets/keyboard_letters/si.png"),
	"sk": preload("res://assets/keyboard_letters/sk.png"),
	"su": preload("res://assets/keyboard_letters/su.png"),
	"tt": preload("res://assets/keyboard_letters/tt.png"),
	"te": preload("res://assets/keyboard_letters/te.png"),
	"ti": preload("res://assets/keyboard_letters/ti.png"),
	"tte": preload("res://assets/keyboard_letters/tte.png"),
	"tto": preload("res://assets/keyboard_letters/tto.png"),
	"tha":preload("res://assets/keyboard_letters/tha.png"),
	"u": preload("res://assets/keyboard_letters/u.png"),
	"y": preload("res://assets/keyboard_letters/y.png"),
	"ya": preload("res://assets/keyboard_letters/ya.png"),
	"ci": preload("res://assets/keyboard_letters/ci.png"),
	"dho": preload("res://assets/keyboard_letters/dho.png"),
	"f": preload("res://assets/keyboard_letters/f.png"),
	"fa": preload("res://assets/keyboard_letters/fa.png"),
	"fri": preload("res://assets/keyboard_letters/fri.png"),
	"fu": preload("res://assets/keyboard_letters/fu.png"),
	"gi": preload("res://assets/keyboard_letters/gi.png"),
	"ha6": preload("res://assets/keyboard_letters/ha6.png"),
	"ii": preload("res://assets/keyboard_letters/ii.png"),
	"ju": preload("res://assets/keyboard_letters/ju.png"),
	"lu": preload("res://assets/keyboard_letters/lu.png"),
	"llu": preload("res://assets/keyboard_letters/llu.png"),
	"mu": preload("res://assets/keyboard_letters/mu.png"),
	"pi": preload("res://assets/keyboard_letters/pi.png"),
	"pr": preload("res://assets/keyboard_letters/pr.png"),
	"rd": preload("res://assets/keyboard_letters/rd.png"),
	"rt": preload("res://assets/keyboard_letters/rt.png"),
	"rz": preload("res://assets/keyboard_letters/rz.png"),
	"sh": preload("res://assets/keyboard_letters/sh.png"),
	"sha": preload("res://assets/keyboard_letters/sha.png"),
	"so": preload("res://assets/keyboard_letters/so.png"),
	"ssh": preload("res://assets/keyboard_letters/ssh.png"),
	"suu": preload("res://assets/keyboard_letters/suu.png"),
	"t": preload("res://assets/keyboard_letters/t.png"),
	"ta": preload("res://assets/keyboard_letters/ta.png"),
	"ttt": preload("res://assets/keyboard_letters/ttt.png"),
	"va": preload("res://assets/keyboard_letters/va.png"),
	"vi": preload("res://assets/keyboard_letters/vi.png"),
	
	
	"bii": preload("res://assets/keyboard_letters/bii.png"),
	"bre": preload("res://assets/keyboard_letters/bre.png"),
	"chi": preload("res://assets/keyboard_letters/chi.png"),
	"dd": preload("res://assets/keyboard_letters/dd.png"),
	"dii": preload("res://assets/keyboard_letters/dii.png"),
	"dou": preload("res://assets/keyboard_letters/dou.png"),
	"gho": preload("res://assets/keyboard_letters/gho.png"),
	"go": preload("res://assets/keyboard_letters/go.png"),
	"hi": preload("res://assets/keyboard_letters/hi.png"),
	"hii": preload("res://assets/keyboard_letters/hii.png"),
	"kri": preload("res://assets/keyboard_letters/kri.png"),
	"ku": preload("res://assets/keyboard_letters/ku.png"),
	"mi": preload("res://assets/keyboard_letters/mi.png"),
	"mo": preload("res://assets/keyboard_letters/mo.png"),
	"no": preload("res://assets/keyboard_letters/no.png"),
	"prri": preload("res://assets/keyboard_letters/prri.png"),
	"shtti": preload("res://assets/keyboard_letters/shtti.png"),
	"stri": preload("res://assets/keyboard_letters/stri.png"),
	"thi": preload("res://assets/keyboard_letters/thi.png"),
	"tta": preload("res://assets/keyboard_letters/tta.png"),
	"tthe": preload("res://assets/keyboard_letters/tthe.png"),
	"ttha": preload("res://assets/keyboard_letters/ttha.png"),
	"tti": preload("res://assets/keyboard_letters/tti.png"),
	"tu": preload("res://assets/keyboard_letters/tu.png"),
	"ye": preload("res://assets/keyboard_letters/ye.png"),
	"ttra": preload("res://assets/keyboard_letters/ttra.png"),
	"ltta": preload("res://assets/keyboard_letters/ltta.png"),
	"nga": preload("res://assets/keyboard_letters/nga.png"),
	
	
	
	
#	"yo": preload(),
#	"yo": preload(),
#	60 letters "":preload()
}

# lbe to lb 
#sho so (same image) rga?? su te/tte ?
#missing gar (burger)
#pee if ok but pe missing
# noo is missing (different to no?) 

var test_levels_a = {
	"ttiuboyel":{
		"spelling":["tti", "u", "b", "o", "ye", "l"],
		"keyboard":["ye","k", "b", "tti","o","li", "rt", "u","l","r"]
	}

}

var test_levels = {
	
#	Easy levels-----

	"bl":{
		"spelling":["b","l"],
		"keyboard":["g","n", "ca", "l","cha","ba", "b", "m","n","s"]
	},

	"apel":{
		"spelling":["a", "pe", "l"],
		"keyboard":["be", "a", "kh", "i", "pe", "n", "g", "l", "cha", "c"]
	},

	"baag":{
		"spelling":["baa", "g"],
		"keyboard":["rri", "g", "e", "me", "baa", "be", "b", "m", "na", "re"]
	},


	"kla":{
		"spelling":["k","la"],
		"keyboard":["b","la","m","na","k","l","ga","n", "cha", "gh"]
		},

	"baks":{
		"spelling":["ba", "ks"],
		"keyboard":["shi","rrga", "ba", "ga","m","ks","g","ra", "cha", "l",]
	},

	"balti":{
		"spelling":["ba", "l", "ti"],
		"keyboard":[ "bi", "ba","b","g","n","ti","m","kh","l","na"]
	},

	"ghrri":{
		"spelling":["gh", "rri"],
		"keyboard":["g","ra", "cha", "l","shi","rri", "ba", "gh","m","na"]
	},

	"ddab":{
		"spelling":["dda", "b"],
		"keyboard":["g","ra", "b", "l","shi","rrga", "dda", "ga","m","na"]
	},

	"gru":{
		"spelling":["g","ru"],
		"keyboard":["ma","ra", "cha", "l","ru","p", "ba", "g","m","na"]
	},

	"hrinn":{
		"spelling":["h", "ri", "nn"],
		"keyboard":["ga","ri","m","na", "bi","h", "gh","b","k","nn"]
	},

	"ddim":{
		"spelling":["ddi", "m"],
		"keyboard":["na","h","g","m", "be", "ddi","c","ks", "cha", "l"]
	},

	"ghr":{
		"spelling":["gh", "r"],
		"keyboard":[ "ga","cha","shi","r", "l","ba","gh", "ra","ks","g"]
	},

	"jg":{
		"spelling":["j","g"],
		"keyboard":[ "l","ma","ru","j","ra", "ba", "g", "cha","m","na"]
	},

	"am":{
		"spelling":["a","m"],
		"keyboard":["g", "l", "ca","a","cha","n", "b", "m","n","s"]
	},

	"thala":{
		"spelling":["tha", "la"],
		"keyboard":[ "b", "l","tt","la","ra","ple", "tha", "ga","m","na"]
	},

	"gach":{
		"spelling":["ga","ch"],
		"keyboard":["p", "ba", "g","ma","ra", "ch", "l","ru","ga","na"]
	},

	"bi":{
		"spelling":["b", "i",],
		"keyboard":["g","ra", "cha", "b","shi","rri", "i", "gh","m","na"]
	},

#	"pakha":{
#		"spelling":["pa", "kha"],
#		"keyboard":["f","la", "ju","c","pa","g","m", "sh", "kha", "l"]
#	},


	"shiyal":{
		"spelling":["shi", "ya", "l"],
		"keyboard":["so","a", "g","ya","pa","go","m", "shi", "e", "l"]
	},

	"frij":{
		"spelling":["fri", "j"],
		"keyboard":["de","ka", "m","j","li","dii","fri", "hi", "i", "tt"]
	},

	"peyara":{
		"spelling":["pe", "ya", "ra"],
		"keyboard":["ku","ci", "pe","f","ra","mi","dd", "ya", "n", "ii"]
	},

	"murgi":{
		"spelling":["mu", "r", "gi"],
		"keyboard":["i","gi", "m","sa","ku","r","fri", "mu", "l", "ne",]
	},

	"cabi":{
		"spelling":["ca", "bi"],
		"keyboard":["te","t", "thi","ca","ja","i","bi", "p", "r", "k",]
	},

	"tala":{
		"spelling":["ta", "la"],
		"keyboard":["ku","dda", "m","ta","li","dii","fri", "la", "tt", "t",]
	},


	"mg":{
		"spelling":["m", "g"],
		"keyboard":["ci", "b", "gh", "m", "tthe", "g", "thi", "su", "r", "k",]
	},


	"shart":{
		"spelling":["sha", "rt"],
		"keyboard":["va","k", "s", "sha","p","li", "rt", "gh","m","r"]
	},

	"juta":{
		"spelling":["ju", "ta"],
		"keyboard":["no","ku", "sh", "ju", "gh","h","p","ta", "c","m",]
	},

	"camc":{
		"spelling":["ca", "m", "c"],
		"keyboard":["d","ra", "m","f","ca","mi","dd", "c", "n", "ii"]
	},

#	"sofa":{
#		"spelling":["so", "fa"],
#		"keyboard":["c","la", "sh", "so", "ke","m","fa","ta", "p","ja",]
#	},

	"tbla":{
		"spelling":["t", "b", "la"],
		"keyboard":["mu","k", "s", "b","p","la", "rt", "gh","t","r"]
	},

	"ttrak":{
		"spelling":["ttra", "k"],
		"keyboard":["mu","k", "s", "b","p","la", "rt", "gh","ttra","r"]
	},

	"valluk":{
		"spelling":["va", "llu", "k"],
		"keyboard":["li","nga", "va", "b","k","la", "rt", "llu","tt","re"]
	},

	"barrgar":{
		"spelling":["ba", "rrga", "r"],
		"keyboard":["sh","l", "rrga", "p","ba","la", "r", "tt","si","o"]
	},

	"birral":{
		"spelling":["bi", "rra", "l"],
		"keyboard":["t","p", "l", "tta","bi","la", "rt", "rra","r","la"]
	},

	"cshma":{
		"spelling":["c", "sh", "ma"],
		"keyboard":["de","tt", "sh","prri","c","i","bi", "ma", "k", "r",]
	},

	"drja":{
		"spelling":["d", "r", "ja"],
		"keyboard":["te","t", "thi","ca","ja","i","bi", "p", "r", "d",]
	},

	"ha6s":{
		"spelling":["ha6", "s"],
		"keyboard":[ "me", "pa", "s","rri", "g", "e", "ha6", "m", "na", "re"]
	},

	"chata":{
		"spelling":["cha", "ta",],
		"keyboard":[ "l","ble", "ta", "bo", "gh", "rri", "cha", "ra", "m","rd"]
	},

	"ceyar":{
		"spelling":["ce", "ya", "r"],
		"keyboard":["g","ce", "cha", "l","r","rrga", "ba", "ya","m","na"]
	},

	"vat":{
		"spelling":["va", "t"],
		"keyboard":[ "l","cha","va","n", "ca", "n","s","ba", "t", "m"]
	},





#	Medium level -------------------------------------------------------

	"ttebil":{
		"spelling":["tte", "bi", "l"],
		"keyboard":[ "l","shi", "tte", "dda", "ga","dde","bi","ra","m","na"]
	},

	"shim":{
		"spelling":["shi", "m"],
		"keyboard":["g","ra", "cha", "l","shi","rrga", "ba", "ga","m","na"]
	},

	"bichana":{
		"spelling":["bi", "cha", "na"],
		"keyboard":["ga","n", "bi", "gh","b","cha","m","kh","k","na"]
	},


	"ckolett":{
		"spelling":["c", "ko", "le", "tt"],
		"keyboard":["ga", "ko","m","c","b","k","tt", "gh","le","nn"]
	},


	"blekbord":{
		"spelling":["ble", "k", "bo", "rd",],
		"keyboard":["g","ra", "k", "l","ble","rri", "bo", "gh","m","rd"]
	},


#	"maflar":{
#		"spelling":["ma", "f", "la", "r"],
#		"keyboard":["de", "ka", "ma", "j", "f", "dii", "r", "hi", "i", "la",]
#	},


	"lbn":{
		"spelling":["l", "b", "n"],
		"keyboard":["f","n", "ju","c","b","g","m", "sh", "kha", "l"]
	},

#	"suic":{
#		"spelling":["su", "i", "c"],
#		"keyboard":["pa","s", "su", "m", "ke","c","fa","i", "p","ja",]
#	},


#	"capata":{
#		"spelling":["ca", "*", "pa", "ta"],
#		"keyboard":["va","pa", "s", "sha","p","ca", "rt", "gh","ta","r"]
#	},


	"projapti":{
		"spelling":["pr", "ja", "p", "ti"],
		"keyboard":["p","sha", "r", "sha","ja", "gh","m","pr", "ti","fa"]
	},

	"botl":{
		"spelling":["bo", "t", "l"],
		"keyboard":[ "l","shi", "bo", "dda", "ga","dde","t","ra","m","na"]
	},

	"balb":{
		"spelling":["ba","lb"], 
		"keyboard":["o","i","ti","ko","bo","te","so","lb", "l", "ba"]
	},

	"garri":{
		"spelling":["ga","rri"], 
		"keyboard":["i","ku","ga","o","bo","ne","de","rri", "rd", "lp"]
	},

	"fulkpi":{
		"spelling":["fu", "l", "k", "pi"], 
		"keyboard":["na","mo","k","si","pi","ne","l","i", "fu", "p"]
	},

	"ciruni":{
		"spelling":["ci", "ru", "ni"],
		"keyboard":[ "gh", "ni", "cha", "ci", "kh", "k", "ga", "ru", "bi", "na"]
	},

	"almari":{
		"spelling":["a", "l", "ma", "ri"],
		"keyboard":[ "ci", "ri", "k","ma","k","a","pi", "l", "bi", "na"]
	},

	"dhol":{
		"spelling":["dho", "l"],
		"keyboard":["ra","ju", "bi", "dho","fu","te","l","mi","k","da"]
	},

	"iigl":{
		"spelling":["ii", "g", "l"],
		"keyboard":["ke","dd", "ii", "ple", "l", "c", "fa", "g", "j","pa",]
	},

	"hati":{
		"spelling":["ha", "ti"],
		"keyboard":["g","ti", "cha", "l","shi","rri", "ha", "gh","m","na"]
	},

	"agun":{
		"spelling":["a", "gu", "n"],
		"keyboard":["ga","a","ri", "bi","n", "m", "na", "gu", "k", "nn"]
	},

	"chagl":{
		"spelling":["cha", "g", "l"],
		"keyboard":["ks","r", "cha", "shi","l","m", "ba", "g","rri","na"]
	},

	"ousshdh":{
		"spelling":["ou", "ssh", "dh"],
		"keyboard":["fu", "g", "ssh", "l", "ou", "rri", "ba", "dh", "m", "na"]
	},

	"banr":{
		"spelling":["ba", "n", "r"],
		"keyboard":["n","c", "r", "l","shi","rri", "ba", "gh","m","na"]
	},


	"kmla":{
		"spelling":["k", "m", "la"],
		"keyboard":["i","gi", "m","sa","k","r","fri", "mu", "la", "ne",]
	},

#	"pitttja":{
#		"spelling":["pi", "ttt", "ja"],
#		"keyboard":[ "b", "l", "ttt","g","ra","pi", "dda", "ja","m","na"]
#	},

	"sap":{
		"spelling":["sa", "p"],
		"keyboard":["li","sa", "va", "b","k","la", "p", "llu","tt","re"]
	},


	"suurzmukhii":{
		"spelling":["suu", "rz", "mu", "khii"],
		"keyboard":["d","rz", "m","su","ca","mu","dd", "suu", "khii", "ii"]
	},

	"ttmetto":{
		"spelling":["tt","me", "tto"],
		"keyboard":["g", "l", "tt", "a","cha","tto", "b", "me","n","s"]
	},

	"ttelivishn":{
		"spelling":["tte", "li", "vi", "sh", "n"],
		"keyboard":[ "b", "li","tte","g","sh","ple", "vi", "ga","m","n"]
	},

	"deyal":{
		"spelling":["de", "ya", "l"],
		"keyboard":["ku","ci", "de","f","ra","l","dd", "ya", "n", "ii"]
	},

	"suta":{
		"spelling":["su", "ta"],
		"keyboard":["m", "be", "su", "g", "ks", "ddi", "ta", "na", "cha", "l"]
	},

	"ghorra":{
		"spelling":["gho", "rra"],
		"keyboard":["f","la", "rra","c","pa","gho","m", "sh", "kha", "l"]
	},

	"ka6tthal":{
		"spelling":["ka6","ttha", "l"],
		"keyboard":[ "l","ma","ru","j","ka6", "ba", "g", "ttha","m","na"]
	},

	"pukur":{
		"spelling":["pu", "ku", "r"],
		"keyboard":["ku","ci", "pu","f","ra","mi","dd", "r", "n", "ii"]
	},

	"tetul":{
		"spelling":["te", "tu", "l"],
		"keyboard":[ "tu","ma","ru","j","te", "ba", "g", "l","m","na"]
	},

	"bri":{
		"spelling":["b", "r", "i"],
		"keyboard":["de","ka", "r","j","li","b","fri", "hi", "i", "tt"]
	},

	"khrgosh":{
		"spelling":["kh","r", "go", "sh"],
		"keyboard":["r","ra", "cha", "kh","ru","go", "ba", "g","m","sh"]
	},


	"ndii":{
		"spelling":["n", "dii"],
		"keyboard":["n","ku", "sh", "ju", "dii","h","p","ta", "c","m",]
	},


	"hiira":{
		"spelling":["hii", "ra",],
		"keyboard":[ "l","ble", "hii", "bo", "gh", "rri", "g", "ra", "m","rd"]
	},

	"patil":{
		"spelling":["pa", "ti", "l"],
		"keyboard":["va","l", "s", "sha","pa","li", "ti", "gh","m","r"]
	},




#	Hard Level --------------------------------------------

	"gajr":{
		"spelling":["ga", "j", "r"],
		"keyboard":["ga", "ka", "ma", "j", "f", "dii", "r", "hi", "i", "la",]
	},

	"aiskrim":{
		"spelling":["a", "i", "s", "kri", "m"],
		"keyboard":["no","i", "s", "kri", "gh","h","p","a", "c","m",]
	},

#	"jaynamaj":{
#		"spelling":["ja", "y", "na", "ma", "j"],
#		"keyboard":["t","y", "l", "ja","bi","na", "rt", "j","r","ma"]
#	},

	"ka6camric":{
		"spelling":["ka6","ca","*","m","ri","c"],
		"keyboard":["m","la","na","ri","ka6","l","c","no", "ca", "ch"]
	},

#	"istri":{
#		"spelling":["i", "stri"],
#		"keyboard":["ga", "ko","stri","c","b","i","tt", "gh","le","nn"]
#	},

	"rajha6s":{
		"spelling":["ra", "j", "ha6", "s"],
		"keyboard":["ha6","tt", "s","prri","c","i","j", "ma", "k", "ra",]
	},

	"lattim":{
		"spelling":["la", "tti", "m"],
		"keyboard":["fu", "tti", "ssh", "a", "la", "rri", "ba", "dh", "m", "na"]
	},

	"singh":{
		"spelling":["si", "ng", "h"],
		"keyboard":["so","h", "g","ya","ng","go","m", "si", "e", "l"]
	},

	"khata":{
		"spelling":["kha","ta"],
		"keyboard":["p", "ba", "g","kha","ra", "ch", "ta","ru","ga","na"]
	},

	"pe6pe":{
		"spelling":["pe6", "pe"],
		"keyboard":["la","pe", "sh", "so", "ke","m","fa","ta", "pe6","ja",]
	},

	"klm":{
		"spelling":["k", "l", "m"],
		"keyboard":["f","na", "k","ta","b","g","m", "sh", "kha", "l"]
	},

	"ddalim":{
		"spelling":["dda", "li", "m"],
		"keyboard":[ "li","cha","g","n", "dda", "n","s","ba", "b", "m"]
	},

	"golap":{
		"spelling":["go", "la", "p"],
		"keyboard":["ga","p","ri", "bi","la", "m", "na", "go", "k", "nn"]
	},

	"dourrano":{
		"spelling":["dou", "rra", "no"],
		"keyboard":["ke","dou", "ii", "ple", "no", "c", "fa", "rra", "j","pa",]
	},

	"sharri":{
		"spelling":["sha", "rri"],
		"keyboard":[ "ci", "ri", "k","ma","sha","a","rri", "l", "bi", "na"]
	},

	"cadr":{
		"spelling":["ca", "d", "r"],
		"keyboard":["g", "r", "ca","a","cha","n", "d", "m","n","s"]
	},

#	"besin":{
#		"spelling":["be", "si", "n"], 
#		"keyboard":["si","ku","ga","o","be","n","de","rri", "rd", "lp"]
#	},

	"ttiya":{
		"spelling":["tti", "ya"],
		"keyboard":["li","ya", "va", "b","k","la", "rt", "llu","tti","re"]
	},

	"ttiuboyel":{
		"spelling":["tti", "u", "b", "o", "ye", "l"],
		"keyboard":["ye","k", "b", "tti","o","li", "rt", "u","l","r"]
	},

	"shapla":{
		"spelling":["sha", "p", "la"],
		"keyboard":["te","t", "sha","ca","la","i","bi", "p", "r", "k",]
	},

	"tthelagarri":{
		"spelling":["tthe", "la", "ga", "rri"],
		"keyboard":["ga","ci", "la","f","ra","tthe","dd", "ya", "rri", "ii"]
	},

	"frring":{
		"spelling":["f", "rri", "ng"],
		"keyboard":["so","a", "rri","ya","f","go","m", "ng", "e", "l"]
	},

	"machi":{
		"spelling":["ma", "chi"],
		"keyboard":["ku","dda", "ma","ta","li","dii","chi", "la", "tt", "t",]
	},


	"shhidminar":{
		"spelling":["sh", "hi", "d", "*", "mi", "na", "r"], 
		"keyboard":["na","d","k","sh","pi","hi","l","mi", "r", "p"]
	},

	"janala":{
		"spelling":["ja", "na", "la"],
		"keyboard":[ "l","ble", "na", "bo", "gh", "ja", "g", "la", "m","rd"]
	},

	"mishtti":{
		"spelling":["mi", "shtti"],
		"keyboard":[ "l","mi", "sk", "dda", "ga","shtti","g","ra","m","na"]
	},

	"pawruti":{
		"spelling":["pa", "u", "ru", "tii"],
		"keyboard":[ "me", "u", "s","rri", "ru", "ta", "tti", "m", "pa", "re"]
	},

	"pata":{
		"spelling":["pa", "ta"],
		"keyboard":[ "me", "pa", "s","rri", "g", "ta", "ha6", "m", "na", "re"]
	},


#	"maltta":{
#		"spelling":["ma", "ltta"],
#		"keyboard":["f","la", "ltta","c","pa","gho","ma", "sh", "kha", "l"]
#	},

	"ga6da":{
		"spelling":["ga6", "da"],
		"keyboard":["m","na","ga6","ri", "bi","h","da", "gh","b","nn"]
	},

	"ayna":{
		"spelling":["a","y", "na"],
		"keyboard":["ma","y", "cha", "l","ru","p", "a", "g","m","na"]
	},

	"alu":{
		"spelling":["a", "lu"],
		"keyboard":["i","gi", "a","sa","k","r","fri", "mu", "lu", "ne",]
	},

#	"pakhi":{
#		"spelling":["pa", "khi"],
#		"keyboard":["g","ra", "pa", "l","shi","khi", "ba", "gh","m","na"]
#	},

#	"rekett":{
#		"spelling":["re","ke", "tt"],
#		"keyboard":[ "l","ma","re","j","ke", "ba", "g", "tt","m","na"]
#	},

	"prrithibii":{
		"spelling":["prri", "thi", "bii"],
		"keyboard":["fu", "thi", "ssh", "a", "la", "prri", "ba", "dh", "bii", "na"]
	},

	"kukur":{
		"spelling":["ku", "ku", "r"],
		"keyboard":[ "b", "l","ku","g","r","ple", "dda", "ga","ru","na"]
	},


	"mishttikumrra":{
		"spelling":["mi", "shtti", "*", "ku", "m", "rra"],
		"keyboard":["ku", "s", "rra", "pa", "mi", "li", "shtti", "gh", "r", "m"]
	},

	"mshari":{
		"spelling":["m", "sha", "ri"],
		"keyboard":["ga","ri", "bi", "sha","b","cha","m","kh","k","na"]
	},

	"jahaj":{
		"spelling":["ja", "ha", "j"],
		"keyboard":["de","ja", "r","j","li","b","fri", "ha", "i", "tt"]
	},


	"kamranga":{
		"spelling":["ka", "m", "ra", "nga"],
		"keyboard":["ks","ra", "cha", "ka","l","m", "ba", "nga","rri","na"]
	},














}

var easy_levels =  {
	"kachamorich":{
		"spelling":["kaa","cha","*","mo","ri","ch"],
		"keyboard":["mo","la","na","ri","kaa","lo","go","no", "cha", "ch"]
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
		"keyboard":["ch","ng","ga","a","ca","Rri","ro","go", "ka", "jo"]
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
	selected_words.clear()
	playing_levels.clear()
	var indexes_avail:Array = []
	var the_keys = all_levels[level_selected].keys()
	for i in 15:
		var index = rng.randi_range(0, the_keys.size()-1)
		var picked_word = the_keys[index]
		selected_words.append(picked_word)
		the_keys.erase(picked_word)
	
	playing_levels = selected_words.duplicate()
#	var all_keys = playing_levels.keys()
#	all_keys_size = all_keys.size()
	total_game_points = 0
	words_complete = 0
#	print (playing_levels)



func get_random_easy_level()-> String:
#	var all_keys = playing_levels.keys()
	all_keys_size = playing_levels.size()
	print ("start rand "+str(all_keys_size))
	var ind = rng.randi_range (0,all_keys_size-1)
#	var picked_key = all_keys[ind]
	var picked_key = playing_levels[temp_number]
	print (picked_key)
	playing_levels.erase(picked_key)
	all_keys_size = all_keys_size - 1		
	return picked_key

