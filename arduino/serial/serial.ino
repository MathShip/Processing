int PIN_TRIG = 7,
    PIN_ECO  = 6;

long duracion, 
     distancia;

void setup() {  
  // Inicialización de la comunicacion serial
  Serial.begin (9600);
  pinMode (PIN_TRIG, OUTPUT);
  pinMode (PIN_ECO, INPUT);
}

void loop() {
  // Disparo inicial
  digitalWrite (PIN_TRIG, LOW);
  delayMicroseconds(2);
  digitalWrite (PIN_TRIG, HIGH);
  delayMicroseconds(10);
  digitalWrite (PIN_TRIG, LOW);
  
  //Recepcion del eco de respuesta
  duracion= pulseIn(PIN_ECO, HIGH);
  distancia= (duracion/2)/29;

  Serial.write(distancia);
  delayMicroseconds(500);
}

