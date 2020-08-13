; apenas um teste de utilização de let
(defun testar-let()
    (let ((a 55)) 
        (print a))
)
;(testar-let)

(defun proximo-o-suficiente? (x y) (< (abs (- x y)) 0.001))
(defun positivo? (numero) (> numero 0))
(defun negativo? (numero) (< numero 0))
(defun zero? (numero) (= numero 0))
(defun media (x y) (/ (+ x y) 2))
;(print (media 10 5))


; implementação de parte do capítulo 1.3.3 
(defun busca (fn ponto-negativo ponto-positivo)
    (let ((meio (media ponto-negativo ponto-positivo)))
        (if (proximo-o-suficiente? ponto-negativo ponto-positivo)
            meio
            (let ((valor-teste (funcall fn meio)))
                (cond 
                    ((positivo? valor-teste) (busca fn ponto-negativo meio))
                    ((negativo? valor-teste) (busca fn meio ponto-positivo))
                    ((zero? valor-teste) meio)
                )
            )
        )
    )
)
;(print (busca (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0))

; implementação de parte do capítulo 1.3.4
(defun quadrado (x) (* x x))
(defun average-damp (fn)
    (lambda (x) (media x (funcall fn x))))
;(print (funcall (average-damp #'quadrado) 10))

;exercício 1.41
(defun inc (x) (+ 1 x))
(defun dobro (fn)
    (lambda (x) (funcall fn (funcall fn x))))
(print (funcall (dobro #'inc) 1))
