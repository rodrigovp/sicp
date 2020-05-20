;
; Contém exercícios e códigos da aula 2, bem como alguns
; testes livres.
;
(defun p(x) (print x)) ; alias para a função print


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun quadrado(x) (* x x))
(defun media(guess x) (/ (+ guess x) 2))

(defun raiz-bloco (x)
	(defun raiz-quadrada(x) (raiz-quadrada-iterativa 1.0 ))
	(defun bom-o-suficiente? (guess)(< (abs (- (quadrado guess) x)) 0.001))
	(defun improve(guess) (media guess (/ x guess)))
	(defun raiz-quadrada-iterativa(guess)
		(if (bom-o-suficiente? guess)
			guess
			(raiz-quadrada-iterativa (improve guess) )
		)
	)
	(raiz-quadrada 2)
)
(p (raiz-bloco 2))
(p (improve 9 )) ; isso não deveria funcionar! Ou deveria? :O