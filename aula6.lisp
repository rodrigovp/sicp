;; capítulo 1.3.1 - Procedures as Arguments
(defun soma-inteiros(a b)
	(if (> a b)
		0
		(+ a (soma-inteiros (+ a 1) b))))
;(print (soma-inteiros 2 3)) ;5
;(print (soma-inteiros 3 2)) ;0

(defun cubo(x) (* x x x))
(defun soma-cubos(a b) 
	(if (> a b)
		0
		(+ (cubo a) (soma-cubos (+ a 1) b))))
;(print (soma-cubos 1 3)) ;36

(defun pi-sum(a b)
	(if (> a b)
		0
		(+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))
;(print (pi-sum 1 3))

; mapcar -> aplica uma dada função repetidamente aos argumentos dados
(defun incrementa(x) (+ x 1))
;(print (mapcar 'incrementa '(1 2 3 4)))

; apply -> aplica uma função a uma lista de argumentos
(apply '+ '(1 2 3 4))
;(print (apply 'cubo '(2)))

(defun funcao-pi(a)(/ 1.0 (* a (+ a 2))))
(defun proximo-pi(a)(+ a 4))

(defun soma(fn1 a b fn2)
	(if (> a b)
		0
		(+ (funcall fn1 a) (soma fn1 (funcall fn2 a) b fn2))
	)
)
(defun identidade(n) n)
;(print (soma #'identidade 2 3 #'incrementa)) ;5 - igual à função semelhante acima
;(print (soma #'cubo 1 3 #'incrementa)) ;36 - igual à função semelhante acima
;(print (soma #'funcao-pi 1 3 #'proximo-pi))
;(print (* 8 (pi-sum 1 10000)))

; Exercício 1.31 - primeira e segunda parte do item a
(defun produto (fn1 a b fn2)
	(if (> a b)
		1
		(* (funcall fn1 a) (produto fn1 (funcall fn2 a) b fn2))
	)
)
;(print (produto #'identidade 1 5 #'incrementa)) ;120

; Exercício 1.32 
(defun acumulador (fnCombinador valorNulo fn1 a b fn2)
	(if (> a b)
		valorNulo
		(funcall fnCombinador (funcall fn1 a) (produto fn1 (funcall fn2 a) b fn2))
	)
)
(defun somar(a b) (+ a b))
(defun multiplicar (a b) (* a b))
;(print (acumulador #'somar 0 #'identidade 2 3 #'incrementa)) ;5
;(print (acumulador #'multiplicar 1 #'identidade 1 5 #'incrementa)) ;120