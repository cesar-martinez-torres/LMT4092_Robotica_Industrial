# Ejemplo sencillo: mover un UR5 de un punto A a un punto B con MoveJ
# Ejecutar desde RoboDK con F5.

from robodk import robolink


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


# Puntos A y B definidos como valores articulares del UR5, en grados.
# El formato es:
# [base, hombro, codo, muneca_1, muneca_2, muneca_3]
punto_A = [0, -90, 90, -90, -90, 0]
punto_B = [45, -75, 100, -115, -90, 30]


# Velocidad articular en grados/segundo.
# Puedes bajar este valor si quieres ver el movimiento mas lento.
robot.setSpeedJoints(25)


print("Moviendo al punto A...")
robot.MoveJ(punto_A)

print("Moviendo al punto B...")
robot.MoveJ(punto_B)

print("Movimiento terminado.")
