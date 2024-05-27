import javascript

from FunctionCall fc
where fc.getCallee().getName() = "eval"
select fc, "Llamada a eval detectada"
