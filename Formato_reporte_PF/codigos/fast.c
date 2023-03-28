#include <16F1937.h>
#fuses XT,NOWDT
#use delay( clock = 4000000 )   // Reloj  de 4 MHz
#use fast_io (B) // Directiva

void main () {
port_b_pullups (TRUE);
set_tris_B(0x01); // Definir entradas y salidas
output_low (PIN_B1); // Escribir salida
while (1)
{
if (input(PIN_B0)==1)
output_low (PIN_B1);
else
output_high (PIN_B1);
}
} 


