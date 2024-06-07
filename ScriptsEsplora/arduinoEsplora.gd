extends Node

const SERCOMM = preload("res://addons/GDSerCommDock/bin/GDSerComm.gdns");
onready var PORT = SERCOMM.new()

onready var com= get_node("UseArduino");

var port = "/dev/ttyACM0"
var baudRate = 9600
var message_to_receive
var message_to_send

## Mensagem armazenada com os caracteres recebidos
var msg = "";
var tiltValue: float = 0.0;

func _ready():
	set_physics_process(false)
	PORT.close()
	if port!=null and baudRate!=0:
		PORT.open(port,baudRate,1000,com.bytesz.SER_BYTESZ_8, com.parity.SER_PAR_NONE, com.stopbyte.SER_STOPB_ONE)
		PORT.flush()
	else:
		print("Não foi possível estabelecer uma comunicação com a porta desejada. Cheque se a porta desejada foi selecionada corretamente.")
	set_physics_process(true)

func _physics_process(delta):
	var msg = "";
	if PORT != null && PORT.get_available()>0:
		for i in range(PORT.get_available()):
			message_to_receive = str(PORT.read())
			
			# Checa se é fim de caractere:
			if message_to_receive == "]":
				# Devemos atualizar a variável agora.
				tiltValue = float(msg);
				print("Novo tiltvalue: ", tiltValue)
				msg = "";
			else:
				msg += message_to_receive;
			print("message_to_receive: ", message_to_receive)
			
func send_text():
	var text=message_to_send.replace(("\\n"),com.endline)

	PORT.write(text) #write function, please use only ascii
