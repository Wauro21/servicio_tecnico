import matplotlib.pyplot as plt



modelos = ["HP 250 G7 (153B5LT)", "ASUS VivoBook X412FA-EB1234T", "ASUS M409DA-EK202T", "Asus X553MA"]

procesadores = ["Intel Core I3-1005G1", "Intel Pentium 5405U", "AMD Ryzen 3 3200U", "Intel Pentium N3450"]

proce_val = [5259, 2305, 3992, 1206]
ram = [4,4,4,4]

almacenamiento = [1000, 128, 256, 1000]

bateria = [41000, 37000, 32000, 30000]
colors = ['blue','green','red','black']
plt.figure(figsize=(10.8,7.2), dpi=100)
# Procesador
plt.subplot(411)
plt.title("Comparativa procesadores")
plt.barh(modelos, proce_val, color=colors)
plt.xlabel("CPU SCORE [-] Mas alto es mejor")

#Ram
plt.subplot(412)
plt.title("Comparativa memoria Ram Instalada")
plt.barh(modelos, ram, color=colors)
plt.axvline(x=8)
plt.text(8.1,1,'Optimo',rotation=90)
plt.xlabel("Ram [Gb] Mas alto es mejor")

# almacenamiento
plt.subplot(413)
plt.title("Comparativa almacenamiento instalado")
plt.barh(modelos, almacenamiento, color=colors)
plt.axvline(x=248)
plt.text(248.1,1,'Optimo',rotation=90)
plt.xlabel("Almacenamiento [Gb]")
plt.tight_layout()

# bateria
plt.subplot(414)
plt.title("Comparativa capacidad batería")
plt.barh(modelos, bateria, color=colors)
plt.xlabel("Capacidad batería [mWh] Más alto es mayor duración")
plt.tight_layout()
plt.savefig("test", dpi=100)
#plt.show()
