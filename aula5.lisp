(defun mdc(a b)
	(print b)
	(if (= b 0)
		a
	(mdc b (rem a b))))
;(print (mdc 144 89))

(defun quadrado(n) (* n n))

(defun menor-divisor(n)

	(defun divide?(a b) (= (rem b a) 0))

	(defun encontrar-divisor(n divisor-teste)
		(cond 
			((> (quadrado divisor-teste) n) n)
			((divide? divisor-teste n) divisor-teste)
			((encontrar-divisor n (+ divisor-teste 1)))
		)
	)
	(encontrar-divisor n 2))
;(print (menor-divisor 19999))

(defun primo?(n)
	(= n (menor-divisor n)))
;(print (primo? 37))

; códigos obtidos na aula4.lisp (par? e potencia-rapida)
; TODO: como referenciar uma função de um script em outro script?
(defun par?(n)
	(= (rem n 2) 0))

(defun potencia-rapida(b e)
	(cond 
		((= e 0) 1)
		((par? e) (quadrado (potencia-rapida b (/ e 2))))
		((* b (potencia-rapida b (- e 1))))))

(defun primo-segundo-fermat?(n)
	(defun primo-segundo-fermat1(n a)
		(= (rem (potencia-rapida a n) n) a)
	)
	(primo-segundo-fermat1 n (- n 1)) ; com a função randômica do common-lisp não rolou!!
)
;(print (primo-segundo-fermat? 13)) 

;(print (= (rem (potencia-rapida 7 12) 12) 7))
;(print (rem 1 10))

;(print (get-internal-real-time))


;(print (random 12))
