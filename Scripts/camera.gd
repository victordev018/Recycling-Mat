extends Camera2D

## variáveis para controlar agitação da camera
var agitationTimer = 0.0;
var agitationAmount = 0.0;
var agitationDuration = 0.0;

## funcção para receber valores para fazer camera tremer
func initShake(amount:float, duration: float) -> void:
	agitationAmount = amount;
	agitationTimer = duration;
	agitationDuration = agitationTimer;
	
func _ready():
	Global.camera = self;
	
func _process(delta) -> void:
	## se a duração de agitação for maior que 0
	if agitationDuration > 0:
		# decrementa o tempo pelo valor de detla
		agitationDuration -= delta;
		# coleta valores aleatórios para x e y do futoro vetor
		var offsetX = (randf() * 2 - 1) * agitationAmount;
		var offsetY = (randf() * 2 - 1) * agitationAmount;
		
		# aplica valores no offset
		offset = Vector2(offsetX, offsetY)
	else:
		offset = Vector2(0, 8);
		
