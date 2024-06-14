extends Area2D

## propriedades do resíduo (Id, texture, isRecyclable)
var residueId : String = "";
onready var residueTexture = get_node("Sprite");
var isRecyclible: bool;

## variável que controla o poder se movimentar do resíduo
var moveResudue:bool = false;
## variável que permite que o residuo vá até a bandeja
var moveResidueToTray: bool = false
## referência ao tempo de vida do resíduo
onready var timer = get_node("Timer");
## variável que verifica se o resíduo possui tempo de vida 
var timerInit: bool = false
## variável que verifica se o timerChoice foi iniciado
var isPlayingTimerChoice: bool = false;
## variável que guarda o valor passado pelo esplora
var valueDirection: float = -20.0;

var direction;

## quando a cena for iniciada
func _ready():
	## informe a globsl que eu sou o nó do resíduo
	Global.residuo = self;
	## esta permitida a movimentação do resíduo em direção ao centro
	moveResidueToTray = true;

func _process(delta):
	## pegando valor passado pelo serial do esplora
#	valueDirection = float(ArduinoEsplora.tiltValue);
#	print("valueDirection: ", valueDirection)
	# mover para cima na esteira
	if moveResidueToTray:
		var _speed = 2; # TODO: trocar pela variável correspondente a velocidade da esteira
		## mudar a posição do residuo gradualmente baseado em uma velocidade
		global_position = global_position.move_toward(Global.levelNode.trayPosition, _speed);
	## checando posição atual do resíduo
	checkPosition()
	## se o resíduo poder ser movimentado
	if moveResudue:
		residueMoviment(delta)

## função para movimentar o residuo:
func residueMoviment(delta) -> void:
	## atribuindo a direction o valor passado pelo esplora
	direction = valueDirection;
	## definindo speed
	var _speed: float = 32;
	
	## se a direção for diferente de 0
	if direction != 0:
		## se o valor de direction for maior oy igaul a 60 ou for pressionado a tecla ui_right
		if direction >= 60 or Input.is_action_just_pressed("ui_right"):
			## mude a posição do resíduo +32px no eixo x
			global_position.x = global_position.x + 32;
		## se o valor de direction for menor ou igual a -70 ou for clicado a tecla ui_left
		elif direction <= -70 or Input.is_action_just_pressed("ui_left"):
			## muda a posição do resíduo -32 px no eixo x
			global_position.x = global_position.x - 32;

## função para checar posiçoes:
func checkPosition() -> void:
	# verifica se o resíduo chegou na bandeija
	if global_position == Global.levelNode.trayPosition:
		## verificando se o choice timer não foi iniciado:
		if !isPlayingTimerChoice:
			## inicia o tempo de escolha
			Global.levelNode.choiceTimer.start();
			## informa para global que o tempo de escolha esta rolando
			isPlayingTimerChoice = true;
		## desativa a animação da esteira
		Global.levelNode.animation.playing = false;
		## define pque o resíduo não pode mais ir em direção ao centro, pois ja esta lá
		moveResidueToTray = false;
		## permite que seja feita a movimentação do resíduo
		moveResudue = true;
	## se não estiver na posição da bandeija
	else:
		## não permite a movientação do resíduo
		moveResudue = false;
	
	# verifica se o resíduo entrou no buraco da direita
	if global_position == Global.levelNode.holeRightPos and !timerInit:
		print("estou no buraco direito")
		## finaliza o tempo de escolha
		Global.levelNode.choiceTimer.stop();
		## define que o tempo de escolha não esta mais rolando
		isPlayingTimerChoice = false;
		## checagem se o resíduo atual possue a propriedade isRecyclable é true e acrescenta +10 pontos no score
		checkRecyclable(true, 10);
		## inicia tempo de vida do resíduo
		timer.start();
		## informa que o tempo de vida esta roalando
		timerInit = true;

	# verifica se o resíduo entrou no buraco da esquerda
	if self.global_position == Global.levelNode.holeLeftPos and !timerInit:
		print("estou no buraco esquerda");
		## finaliza o tempo de escolha		
		Global.levelNode.choiceTimer.stop();
		## define que o tempo de escolha não esta mais rolando		
		isPlayingTimerChoice = false;
		## checagem se o resíduo atual possue a propriedade isRecyclable é falsa e acrescenta +10 pontos no score		
		checkRecyclable(false, 10);
		## inicia tempo de vida do resíduo		
		timer.start();
		## informa que o tempo de vida esta roalando
		timerInit = true;
		
## quando o tempo do resíduo acabar
func _on_Timer_timeout():
	## deleta o resíduo da cena
	queue_free();
	## informa pra global que pode instanciar um novo resíduo
	Global.instanciateResidue = true;
	
## função para verificar se o player acertou se o resíduo é ou não reciclável
func checkRecyclable(condition: bool, points:int) -> void:
	# se a propriedade "recyclable" do resíduo obedecer for igual a condição
	if isRecyclible == condition:
		# incrementa pontos
		Global.score += points;
		# toca a música de efeito
		Global.soundCorrectAnswer.play();
		# inicia o timer de duração de música
		Global.timerSound.start();
		
	else:
		# chamando função para tremer tela
		Global.camera.initShake(4.0, 0.5);
		# decrementando score
		Global.score -= points/2;
		# toca música de erro
		Global.soundErrorAnswer.play()
		# iniciando o timer de duração de música
		Global.timerSound.start();
	
