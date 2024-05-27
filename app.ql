import javascript

// Buscar todos los archivos JavaScript en el repositorio
from javascript file
where
  // Buscar llamadas a funciones vulnerables conocidas
  exists(CallExpr call, string functionName) |
  call.getTarget().getName() = functionName
select call, "Potential vulnerable call to " + functionName
