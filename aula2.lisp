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
	(defun bom-o-suficiente? (guess) (< (abs (- (quadrado guess) x)) 0.0001))
	(defun improve(guess) (media guess (/ x guess)))
	(defun raiz-quadrada-iterativa(guess)
		(if (bom-o-suficiente? guess)
			guess
			(raiz-quadrada-iterativa (improve guess) )
		)
	)
	(raiz-quadrada x)
)
;(p (raiz-bloco 1000))
;(p (improve 1)) ; NÃO FUNCIONA!

;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Exercício 1.6
(defun new-if(predicate then-clause else-clause)
	(cond 
		(predicate then-clause)
		(else-clause)
	)
)
;(p (new-if (= 2 3) 0 5))
;(p (new-if (= 1 1) 0 5))

(defun raiz-new-if (x)
	(defun raiz-quadrada(x) (raiz-quadrada-iterativa 1.0))
	(defun bom-o-suficiente? (guess) (< (abs (- (quadrado guess) x)) 0.001))
	(defun improve(guess) (media guess (/ x guess)))
	(defun raiz-quadrada-iterativa(guess)
		(new-if (bom-o-suficiente? guess)
			guess
			(raiz-quadrada-iterativa (improve guess) )
		)
	)
	(raiz-quadrada x)
)
;(p (raiz-new-if 3))

; x/y^2 + 2y 
; ----------
;     3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; exercício 1.8
(defun raiz-cubica(x)
	(defun bom-o-suficiente? (y) (< (abs (- (* y y y) x)) 0.001))
	(defun improve(y) 
		(/ 
			(+ 
				(* 2 y) 
				(/ x (quadrado y))
			)
			3
		)
	)
	(defun raiz-cubica-iterativa(y)
		(p y)
		(if (bom-o-suficiente? y)
			y
			(raiz-cubica-iterativa(improve y))
		)
	)
	(raiz-cubica-iterativa 1.0)
)
(p (raiz-cubica 4))

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
