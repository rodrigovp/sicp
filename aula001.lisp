(defun maior-entre-dois-numeros(x y)
	(cond
		((< x y) y)
		((> x y) x)
		(t x) ; valor default
	)
)
;(print (maior-entre-dois-numeros 3 3))
;;;;;

(defun maior-entre-dois-numeros-com-ifs (x y)
	(if (< x y) 
		y
		x)
)
;(print (maior-entre-dois-numeros-com-ifs 4 5))
;(print (maior-entre-dois-numeros-com-ifs 5 4))
;(print (maior-entre-dois-numeros-com-ifs 5 5))

(defun ao-quadrado(x) (* x x))

(defun soma-de-quadrados(x y)
	(+ (ao-quadrado x) (ao-quadrado y))
)
;(print (soma-de-quadrados 3 3))
;;;;;

(defun f (a)
	(soma-de-quadrados (+ a 1) (* a 2))
)
;(print (f 5))

; Exercício 1.1
(defvar a 3)
(defvar b (+ a 1))

;(print (+ a b (* a b)))

; Exercício 1.2
(defvar resposta 
	(/ 
	(+ 4 5 (- 2 (- 3 (+ 6 (/ 4 5))))) 
	(* 3 (- 6 2) (- 2 7))))
;(print resposta)

; Exercício 1.3

(defun soma-dos-quadrados-dos-dois-maiores-numeros (x y z)
	(cond
		((and (<= x y) (<= x z)) (soma-de-quadrados y z))
		((and (<= y x) (<= y z)) (soma-de-quadrados x z))
		(t (soma-de-quadrados x y)) 
	)
)
;(print (soma-dos-quadrados-dos-dois-maiores-numeros 1 2 3))
;(print (soma-dos-quadrados-dos-dois-maiores-numeros 3 2 1))
;(print (soma-dos-quadrados-dos-dois-maiores-numeros 3 1 2))
;(print (soma-dos-quadrados-dos-dois-maiores-numeros 2 1 3))
;(print (soma-dos-quadrados-dos-dois-maiores-numeros 1 3 2))

; Exercicio 1.5
(defun p()(p))

(defun test (x y)
	(if (= x 0)
		0
		y
	)
)

;(test 0 (p))

; Sub título 1.1.7
(defun media (x y) (/ (+ x y) 2))
;(print (media 4 2))

(defun melhorar (x aproximacao) (media aproximacao (/ x aproximacao)))
;(print (melhorar 1 1.0))

(defun boa-o-suficiente? (aproximacao x) (< (abs (- (ao-quadrado aproximacao) x)) 0.001))
;(print (boa-o-suficiente? 0.001 1))

(defun raiz-quadrada-iterativa (aproximacao x)
	(if (boa-o-suficiente? aproximacao x)
		aproximacao
		(raiz-quadrada-iterativa (melhorar aproximacao x) x)
	)
)
(print (raiz-quadrada-iterativa 1 9))

(defun raiz-quadrada (x)
	(raiz-quadrada-iterativa 1 x)
)

;(print (raiz-quadrada 9))
