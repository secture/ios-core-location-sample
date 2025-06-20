# Sample project: Core Location 📍

## Introducción

Este proyecto demuestra cómo utilizar **Core Location** para rastrear la ubicación del usuario, monitorear cambios significativos de ubicación y manejar visitas a lugares importantes (como el hogar, el trabajo, etc.). También muestra cómo enviar **notificaciones locales** cuando la ubicación del usuario cambia.

## Características:
- Rastrear la ubicación del usuario en tiempo real usando `CLLocationManager`.
- Monitorear **cambios significativos de ubicación** (por ejemplo, movimiento de más de 500 metros).
- **Monitorear visitas** a lugares importantes (por ejemplo, hogar, trabajo).
- **Enviar notificaciones locales** cuando la ubicación cambia o se detecta una visita.
- Mostrar información de la ubicación (latitud, longitud) en la aplicación.
- Funciona con **rastreo de ubicación en primer plano y en segundo plano**.

## Configuración:
1. **Abrir el proyecto** en **Xcode**.
2. Asegúrate de que tu **Xcode Team** esté configurado en **Signing & Capabilities**.
3. **Añadir el framework `CoreLocation`** al proyecto:
   - Ve a **Build Phases** → **Link Binary with Libraries** → **+** → Añadir **CoreLocation.framework**.
4. **Añadir permisos requeridos** a `Info.plist`:
   ```xml
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>Necesitamos acceso a tu ubicación para rastrear tus movimientos y proporcionar funciones basadas en la ubicación.</string>

   <key>NSLocationAlwaysUsageDescription</key>
   <string>Necesitamos acceso a tu ubicación incluso cuando la app esté en segundo plano para seguir rastreando tus movimientos.</string>

   <key>UIBackgroundModes</key>
   <array>
       <string>location</string>
   </array>
**Uso**:
Solicitud de Permiso de Ubicación:

Al iniciar la aplicación por primera vez, se pedirá permiso para acceder a la ubicación.

La aplicación solicita NSLocationWhenInUseAuthorization y NSLocationAlwaysAuthorization para acceder a la ubicación mientras la app esté en primer plano o en segundo plano.

**Rastrear Ubicación**:

La aplicación comienza a rastrear la ubicación del usuario y actualiza la UI con las coordenadas actuales (latitud y longitud).

**Monitorear Visitas**:

Cuando el usuario llega o sale de un lugar predefinido.

**Probar Actualizaciones de Ubicación**:

Ejecuta la aplicación en un dispositivo real para rastrear la ubicación en tiempo real.

Simula cambios de ubicación en la función Location Simulation de Xcode para probar las actualizaciones de ubicación y las notificaciones.

**Notificaciones**:

La aplicación mostrará notificaciones locales cuando se detecte un cambio significativo de ubicación.

**Permisos Requeridos**:
**Permiso de Ubicación**:

La aplicación solicita permiso para usar los servicios de ubicación (NSLocationWhenInUseAuthorization y NSLocationAlwaysAuthorization).

Acceso a Ubicación en Segundo Plano:

Para permitir el rastreo de ubicación en segundo plano, la aplicación también solicita UIBackgroundModes con location en Info.plist.

Conclusión:
Este proyecto de ejemplo muestra cómo rastrear la ubicación del usuario, monitorear visitas y enviar notificaciones locales cuando ocurren cambios significativos. Puedes expandir este proyecto agregando más características, como personalizar la lógica de detección de visitas o integrar vistas de mapa para mostrar las ubicaciones rastreadas.
