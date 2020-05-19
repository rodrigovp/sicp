;
; Contém exercícios do cap 1.2, bem como alguns
; testes livres.
;
(defun p(x) (print x)) ; alias para a função print
(defun media(guess x) (/ (+ guess x) 2))
(p (media 10 0))

(defun quadrado(x) (* x x))

(defun improve(guess x) 
	(media guess (/ x guess))
)

(defun bom-o-suficiente?(guess x)
	(< (abs (- (quadrado guess) x)) 0.001)
)

(defun raiz-quadrada-iterativa(guess x)
	(if (bom-o-suficiente? guess x)
		guess
		(raiz-quadrada-iterativa (improve guess x) x)
	)
)
(p (raiz-quadrada-iterativa 1 2))
(defun raiz-quadrada(x) (raiz-quadrada-iterativa 1.0 x))
(p (raiz-quadrada 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(block foo
	(print 'hello)
	(return-from foo 43))