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
		(+ (cubo a) (soma-cubos (+ a 1) b))
	)
)
;(print (soma-cubos 1 3))

(defun pi-sum(a b)
	(if (> a b)
		0
		(+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))
	)	
)
;(print (pi-sum 2 2))

;(define (sum term a next b)
;	(if (> a b)
;		0
;		(+ (term a) (sum term (next a) next b))))

; mapcar -> aplica uma dada função repetidamente aos argumentos dados
(defun soma-um(x) 
	(print (+ x 1))
)
;(print (mapcar 'soma-um '(1 2 3 4)))

; apply -> aplica uma função a uma lista de argumentos
;(apply '+ '(1 2 3 4))
;(print (apply 'cubo '(2)))

(defun soma (a b) (+ a b))
;(print (soma 3 2))

(defun chama-funcao-soma (fn x y z)
	(+ (funcall fn x y) z)
)
;(print (chama-funcao-soma #'soma 3 2 3))

(defun funcao-x(fn1 a b)
	(if (> a b)
		0
		(+ (funcall fn1 a) (soma-cubos (+ a 1) b))
	)
)
(print (funcao-x #'cubo 1 3))

