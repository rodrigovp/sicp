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
;(p (raiz 2 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sub título 1.2.4
(defun potencia-iter(b e)
	(defun potencia-iter_(b counter product)
		(if (= counter 0)
			product
			(potencia-iter_ b (- counter 1) (* b product))))
	(potencia-iter_ b e 1)
)
;(p(potencia-iter 2 4))

(defun par?(n)
	(= (rem n 2) 0))

(defun quadrado(x)
	(* x x))

(defun potencia-rapida(b e)
	(cond 
		((= e 0) 1)
		((par? e) (quadrado (potencia-rapida b (/ e 2))))
		((* b (potencia-rapida b (- e 1))))))

(p (potencia-rapida 3 7))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; exercício 1.16
;; ver https://codology.net/post/sicp-solution-exercise-1-16/