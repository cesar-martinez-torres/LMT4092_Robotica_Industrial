from robodk.robolink import *  # API para comunicarse con RoboDK
from robodk.robomath import *  # Operaciones matemáticas básicas
import tkinter as tk
from tkinter import simpledialog, messagebox

# Crear ventana para solicitar parámetros
root = tk.Tk()
root.withdraw()  # Ocultar ventana principal

# Solicitar parámetros al usuario
R_max = simpledialog.askinteger("Input", "Escribe el radio en mm:", minvalue=10)
n_turns = simpledialog.askinteger("Input", "Escribe el Número de vueltas", minvalue=1)
n_points = simpledialog.askinteger("Input", "Escribe el número de puntos en cada vuelta", minvalue=10)

# Conectar con RoboDK
RDK = Robolink()

# Seleccionar un robot
robot = RDK.ItemUserPick('Select a robot', ITEM_TYPE_ROBOT)
if not robot.Valid():
    raise Exception('No robot selected or available')

# Obtener la posición actual del TCP
target_ref = robot.Pose()
pos_ref = target_ref.Pos()
print("Tracing a spiral around the target:")
print(Pose_2_TxyzRxyz(target_ref))

# Mover el robot a la posición inicial
robot.MoveJ(target_ref)

# Configurar referencia, herramienta, redondeo y velocidad
robot.setPoseFrame(robot.PoseFrame())
robot.setPoseTool(robot.PoseTool())
robot.setRounding(2)
robot.setSpeed(200)

# Dibujar la espiral alrededor del punto de referencia
total_points = n_turns * n_points
for i in range(total_points + 1):
    ang = i * 2 * pi / n_points  # Ángulo en radianes
    R = (i / total_points) * R_max  # Radio progresivo
    
    # Crear una copia de la pose de referencia
    target_i = Mat(target_ref)
    pos_i = target_i.Pos()
    pos_i[0] = pos_ref[0] + R * cos(ang)  # X
    pos_i[1] = pos_ref[1] + R * sin(ang)  # Y
    target_i.setPos(pos_i)
    
    print("Moving to target %i: angle %.1f, radius %.1f" % (i, ang * 180 / pi, R))
    print(str(Pose_2_TxyzRxyz(target_i)))
    robot.MoveL(target_i)  # Movimiento lineal entre puntos
    RDK.Render()

# Volver al punto de inicio
robot.MoveL(target_ref)

# Mostrar mensaje de confirmación
tk.messagebox.showinfo("Completed", "El espiral ha sido dibujado correctamente!")

print('Done')
