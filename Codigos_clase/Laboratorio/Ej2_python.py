from robodk.robolink import *  # API para comunicarse con RoboDK
from robodk.robomath import *  # Operaciones matemáticas básicas

# Conectar con RoboDK
RDK = Robolink()

# Seleccionar un robot
robot = RDK.ItemUserPick('Select a robot', ITEM_TYPE_ROBOT)
if not robot.Valid():
    raise Exception('No robot selected or available')

# Obtener la posición actual del TCP
target_ref = robot.Pose()
pos_ref = target_ref.Pos()
print("Tracing a circle around the target:")
print(Pose_2_TxyzRxyz(target_ref))

# Mover el robot a la posición inicial
robot.MoveJ(target_ref)

# Configurar referencia, herramienta, redondeo y velocidad
robot.setPoseFrame(robot.PoseFrame())
robot.setPoseTool(robot.PoseTool())
robot.setRounding(10)
robot.setSpeed(200)

# Definir parámetros del círculo
n_points = 500  # Número de puntos para aproximar el círculo
R = 100  # Radio en mm

# Dibujar el círculo alrededor del punto de referencia
for i in range(n_points + 1):
    ang = i * 2 * pi / n_points  # Ángulo en radianes
    
    # Crear una copia de la pose de referencia
    target_i = Mat(target_ref)
    pos_i = target_i.Pos()
    pos_i[0] = pos_ref[0] + R * cos(ang)  # X
    pos_i[1] = pos_ref[1] + R * sin(ang)  # Y
    target_i.setPos(pos_i)
    
    print("Moving to target %i: angle %.1f" % (i, ang * 180 / pi))
    print(str(Pose_2_TxyzRxyz(target_i)))
    robot.MoveL(target_i)  # Movimiento lineal entre puntos

# Volver al punto de inicio
robot.MoveL(target_ref)

print('Done')
