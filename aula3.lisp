;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Exercício 1.11 (recursivo):
(defun soma-3-numeros (a b c) (+ a b c))
;(p (soma-3-numeros 1 2 3))

(defun r-function (n)
	(if (< n 3)
		n
		(+ 
			(r-function (- n 1))
			(* 2 (r-function(- n 2)))
			(* 3 (r-function(- n 3)))
		)
	)
)

; bugada!
(defun i-function (n)
	(defun i-function-iter (count n r)	
		(p '-----)
		(p count)
		(p n)
		(p r)
		(p '-----)
		(if (= count 0)
			r
			(i-function-iter
				(- count 1)
				n
				(+
					r
					(*
						count
						(- n count)
					)
				) 
			)	
		)
	)
	
	(cond 
		((< n 3) n)
		;((= n 3) 4)
		((i-function-iter 3 n 0))
	)
)
;(p (r-function 4))
;(p (i-function 4))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Exercício 1.12 (Triângulo de pascal)
; resolução baseada na explicação dada no link https://brasilescola.uol.com.br/matematica/numeros-binomiais.htm
(defun fatorial (n)
	(cond 
		((= n 0) 1)
		((= n 1) 1)
		((* n (fatorial (- n 1))))
	)
)
;(p (fatorial 3))

(defun binomial(n m)
	(/
		(fatorial n)
		(*
			(fatorial m)
			(fatorial (- n m))
		)
	)
)
;(p (binomial 0 0))

(defun linha(n)
	(defun linha_(n m)
		(cond
			((= m 0) 1)
			(
				(p(binomial n m))
				(linha_ n (- m 1))
			)
		)
	)
	(linha_ n n)
)
;(p (linha 0))

(defun triangulo-pascal(n)
	(p (linha n))
	(p '-----)
	(if (> n 0)
		(triangulo-pascal (- n 1))
	)
)
(triangulo-pascal 5)