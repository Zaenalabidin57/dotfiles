//Lampu tepuk
const int pinLampu = 3;
const int pinAnalog = A0;
const int ambangRerata = 15;
const int jumSempel = 128;
const int nilaiDasar = 514;

int totalIsyarat = 0;;
boolean statusLampu = false;

void setup() {
Serial.begin (9600);
pinMode (pinLampu, OUTPUT);
}

void loop() {
int nilaiAnalog;

totalIsyarat = 0;
for (int j = 1; j <= jumSempel; j++)
{
  nilaiAnalog = analogRead (pinAnalog);

  int isyarat = abs (nilaiAnalog - nilaiDasar);
  totalIsyarat += isyarat;
}

int rerataIsyarat = totalIsyarat / jumSempel;

Serial.print ("Nilai Analog : ");
Serial.print (nilaiAnalog);
Serial.print (", Rerata: ");
Serial.println (rerataIsyarat);

if (rerataIsyarat >= ambangRerata)
{
  statusLampu = not statusLampu;
  digitalWrite (pinLampu, statusLampu);
  delay (2000);
}
}
