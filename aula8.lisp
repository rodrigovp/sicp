; implementação de parte do capítulo 2.1.1
(defvar x (cons 1 2))
;(print (car x))
;(print (cdr x))

(defun numero-racional (num den) (cons num den))
(defun numerador (numero-racional) (car numero-racional))
(defun denominador (numero-racional) (cdr numero-racional))
(defun imprimir-numero-racional (numero-racional)
    (terpri)
    (print (numerador numero-racional))
    (print '/)
    (print (denominador numero-racional)))
(defvar um-meio (numero-racional 1 2))
(imprimir-numero-racional um-meio)

(defun adicao-fracoes (x y)
    (numero-racional
        (+
            (*
                (numerador x)
                (denominador y)
            )
            (*
                (numerador y)
                (denominador x)
            )
        )
        (*
            (denominador x)
            (denominador y)
        )
    )
)
(imprimir-numero-racional 
    (adicao-fracoes (numero-racional 1 5) 
                    (numero-racional 3 7)))

(defun mdc(a b)
	(if (= b 0)
		a
	(mdc b (rem a b))))

; melhoria nas funções numerador e denominador da aula 8,
; conforme capítulo 2.1.2 do livro

(defun numerador2 (numero-racional)
    (let (g (mdc (car numero-racional) (cdr numero-racional))))
    (/ (car numero-racional) g))

(defun denominador2 (numero-racional)
    (let (g (mdc (car numero-racional) (cdr numero-racional))))
    (/ (cdr numero-racional) g))
