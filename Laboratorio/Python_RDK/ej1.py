# Type help("robodk.robolink") or help("robodk.robomath") for more information
# Press F5 to run the script from RoboDK

import math
import os

from robodk import robolink      # Conexion con RoboDK
from robodk import robomath      # Matematicas: poses, matrices, rotaciones
from robodk import robodialogs   # Ventanas/dialogos simples
from robodk import robofileio    # Utilidades de archivos y rutas
from robodk import roboapps      # Utilidades para RoboDK Apps/Add-ins


# Link to RoboDK
RDK = robolink.Robolink()


def title(text):
    """Print a section title in the RoboDK console."""
    print("\n" + "=" * 60)
    print(text)
    print("=" * 60)


def show_public_names(module, max_names=25):
    """Show public functions/classes available in a module."""
    names = [name for name in dir(module) if not name.startswith("_")]
    print("Primeros nombres publicos disponibles:")
    for name in names[:max_names]:
        print(" - " + name)
    if len(names) > max_names:
        print(" ...")


# -------------------------------------------------------------------------
# 1) robolink: hablar con la estacion RoboDK
# -------------------------------------------------------------------------
title("1) robolink: buscar elementos de la estacion")

print("Items en la estacion:")
for item in RDK.ItemList():
    print(" - " + item.Name() + " | tipo: " + str(item.Type()))

robot = RDK.Item("", robolink.ITEM_TYPE_ROBOT)
if robot.Valid():
    print("\nRobot encontrado: " + robot.Name())
    print("Pose actual del robot:")
    print(robot.Pose())
else:
    print("\nNo se encontro ningun robot en la estacion.")


# -------------------------------------------------------------------------
# 2) robomath: crear poses con traslaciones y rotaciones
# -------------------------------------------------------------------------
title("2) robomath: crear una pose")

# transl(x, y, z) crea una traslacion en mm.
# rotz(angulo) crea una rotacion alrededor del eje Z, en radianes.
pose_ejemplo = robomath.transl(300, 100, 250) * robomath.rotz(math.radians(90))

print("Pose creada con transl(300, 100, 250) * rotz(90 grados):")
print(pose_ejemplo)

if hasattr(robomath, "Pose_2_TxyzRxyz"):
    print("La misma pose como [x, y, z, rx, ry, rz]:")
    print(robomath.Pose_2_TxyzRxyz(pose_ejemplo))


# -------------------------------------------------------------------------
# 3) robodialogs: ventanas simples para pedir o mostrar informacion
# -------------------------------------------------------------------------
title("3) robodialogs: mensajes y entrada de texto")

if hasattr(robodialogs, "mbox"):
    try:
        robodialogs.mbox("Hola desde robodialogs.mbox()")
    except Exception as error:
        print("No se pudo mostrar el mensaje: " + str(error))

    try:
        texto = robodialogs.mbox("Escribe un nombre de prueba:", entry="UR5")
        print("Texto capturado: " + repr(texto))
    except TypeError:
        print("Tu version de mbox no soporta el parametro entry.")
    except Exception as error:
        print("No se pudo pedir texto: " + str(error))
else:
    print("Esta version no tiene robodialogs.mbox().")

# Otros dialogos posibles dependen de la version de RoboDK.
# Descomenta y ajusta si existen en tu instalacion:
#
# archivo = robodialogs.getOpenFileName(
#     path_preference="",
#     strfile="",
#     defaultextension=".txt",
#     filetypes=[("Text files", ".txt")]
# )
# print("Archivo seleccionado: " + str(archivo))


# -------------------------------------------------------------------------
# 4) robofileio: trabajar con rutas y archivos
# -------------------------------------------------------------------------
title("4) robofileio: informacion de rutas")

script_path = globals().get("__file__", os.path.join(os.getcwd(), "ej1.py"))
print("Ruta usada para el ejemplo:")
print(script_path)

examples = [
    ("getFileDir", script_path),
    ("getFileName", script_path),
    ("getBaseName", script_path),
    ("getFileExt", script_path),
    ("FileExists", script_path),
    ("DirExists", os.path.dirname(script_path)),
]

for function_name, value in examples:
    function = getattr(robofileio, function_name, None)
    if callable(function):
        try:
            print(function_name + "(" + repr(value) + ") -> " + repr(function(value)))
        except Exception as error:
            print(function_name + " fallo: " + str(error))
    else:
        print(function_name + " no existe en esta version.")


# -------------------------------------------------------------------------
# 5) roboapps: utilidades para crear Apps/Add-ins de RoboDK
# -------------------------------------------------------------------------
title("5) roboapps: explorar utilidades de Apps")

print("roboapps se usa mas cuando quieres crear una App/Add-in de RoboDK.")
print("Para un script normal de robot, casi siempre usaras robolink y robomath.")
show_public_names(roboapps)

for name in ["AppSettings", "RunApplication", "Unchecked", "Checked", "KeepChecked"]:
    value = getattr(roboapps, name, None)
    print(name + " -> " + repr(value))


# -------------------------------------------------------------------------
# 6) Mini ejemplo mezclando varios modulos
# -------------------------------------------------------------------------
title("6) ejemplo combinado")

if robot.Valid():
    print("Robot listo para programar: " + robot.Name())
    print("Pose de ejemplo que podrias usar como objetivo:")
    print(pose_ejemplo)

    # Para mover el robot en simulacion, descomenta esta linea con cuidado:
    # robot.MoveJ(pose_ejemplo)
else:
    print("Agrega o carga un UR5 en la estacion para probar movimientos.")

print("\nFin de los ejemplos.")
