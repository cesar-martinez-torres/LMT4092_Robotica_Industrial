# Ejemplo sencillo: mover un UR5 de un punto A a un punto B con MoveL
# Ejecutar desde RoboDK con F5.

from robodk import robolink
from robodk import robomath


# Conexion con RoboDK
RDK = robolink.Robolink()


# Buscar especificamente un robot llamado UR5.
# Si no lo encuentra, toma el primer robot disponible en la estacion.
robot = RDK.Item("UR5", robolink.ITEM_TYPE_ROBOT)
if not robot.Valid():
    robot = RDK.Item("", robolink.ITEM_TYPE_ROBOT)

if not robot.Valid():
    raise Exception("No se encontro ningun robot en la estacion.")

print("Robot seleccionado: " + robot.Name())


# Punto inicial articular para dejar el robot en una posicion conocida.
# El formato es:
# [base, hombro, codo, muneca_1, muneca_2, muneca_3]
punto_inicio = [0, -90, 90, -90, -90, 0]


# Velocidad lineal en mm/s y velocidad articular en grados/s.
robot.setSpeed(100)
robot.setSpeedJoints(25)


print("Moviendo a la posicion inicial con MoveJ...")
robot.MoveJ(punto_inicio)


# Para MoveL usamos poses cartesianas.
# A sera la pose actual del robot despues del MoveJ.
punto_A = robot.Pose()

# B sera A desplazado 100 mm en X.
punto_B = punto_A * robomath.transl(1000000, 0, 0)


print("Moviendo linealmente al punto A...")
robot.MoveL(punto_A)

print("Moviendo linealmente al punto B...")
robot.MoveL(punto_B)

print("Movimiento lineal terminado.")
