;
; Contém exercícios e códigos da aula 2, bem como alguns
; testes livres.
;
(defun p(x) (print x)) ; alias para a função print

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Trabalha com os conceitos de block structure e lexical scoping

(defun quadrado(x) (* x x))
(defun media(a b) (/ (+ a b) 2))

(defun raiz-bloco (x)
	(defun raiz-quadrada(x) (raiz-quadrada-iterativa 1.0))
	(defun bom-o-suficiente? (guess) (< (abs (- (quadrado guess) x)) 0.001))
	(defun improve(guess) (media guess (/ x guess)))
	(defun raiz-quadrada-iterativa(guess)
		(if (bom-o-suficiente? guess)
			guess
			(raiz-quadrada-iterativa (improve guess) )
		)
	)
	(raiz-quadrada 2)
)
;(p (raiz-bloco 3))
;(p (improve 9)) ; isso não deveria funcionar! Ou deveria? :O

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; exercício 1.10
(defun ackermann (x y)
	(cond 
		((= y 0) 0)
		((= x 0) (* 2 y))
		((= y 1) 2)
		(
			(
				ackermann (- x 1) (ackermann x (- y 1))
			)
		)
	)
)
;(p (ackermann 1 10))
;(p (ackermann 2 4))
;(p (ackermann 3 3))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sub-título 1.2.2
; FAZER ATÉ O EXERCÍCIO 1.15

(defun fibonacci-recursivo(n)
	(cond
		((= n 0) 0)
		((= n 1) 1)
		(
			(+ 
				(fibonacci-recursivo (- n 1))
				(fibonacci-recursivo (- n 2))
			)
		)
	)
)
;(p (fibonacci-recursivo 10))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun fibonacci-iterativo(n)
	(defun fib-iter(a b count)
		(if (= count 0)
			b
			(fib-iter (+ a b) a (- count 1))))
	(fib-iter 1 0 n)
)
;(p (fibonacci-iterativo 1000))

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
(p (i-function 4))


