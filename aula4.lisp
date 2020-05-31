(defun p(x) (print x)) ; alias para a função print


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; código baseado nos exercícios 1.6 e 1.8 e no algoritmo de Newton
(defun potencia (base expoente)
	(if(= expoente 0)
		1
		(* base (potencia base (- expoente 1)))
	)

)
;(p (potencia 2 3))

(defun raiz(indice radicando)

	(defun aproximar_ (aproximacao-potencia aproximacao-multi)
		(/
			(+
				(/ radicando aproximacao-potencia)
				aproximacao-multi)
			indice))

	(defun aproximar(indice aproximacao)
		(aproximar_ (potencia aproximacao (- indice 1)) (* (- indice 1) aproximacao))
	)

	(defun bom-o-suficiente? (aproximacao indice) 
		(< (abs (- (potencia aproximacao indice) radicando)) 0.001)
	)

	(defun raiz-iter(aproximacao indice)
		(p aproximacao)
		(if (bom-o-suficiente? aproximacao indice)
			aproximacao
			(raiz-iter (aproximar indice aproximacao) indice)
		)
	)
	(raiz-iter 1.0 indice)
)
(p (raiz 3 125000))