; Contém alguns testes livres, para esquentar os motores em caso de necessidade

(defvar variavel 2)
;(print variavel)

;;;;;;

(defun ao-quadrado(x) (* x x))
;(print (ao-quadrado 4))
;;;

(defun eh-par(numero) 
	(= (mod numero 2) 0)
)
;(print (eh-par 2))
;(print (eh-par 3))
;;;;;

(defun maior-entre-dois-numeros(x y)
	(cond
		((< x y) y)
		((> x y) x)
		((= x y) x)
	)
)
(print (maior-entre-dois-numeros 3 3))