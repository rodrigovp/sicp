; exercício 2.21
(defun elevar-ao-quadrado (lista)
    (if (null lista)
        nil
        (cons (expt (car lista) 2) (elevar-quadrado (cdr lista)))
    )
)
;(print (elevar-ao-quadrado (list 1 2 3 4 5)))

(defun elevar-ao-quadrado2(lista)
    (mapcar (lambda (x) (expt x 2)) lista)
)
;(print (elevar-ao-quadrado2 (list 1 2 3 4 5)))

; exercício 2.23
(defun for-each (funcao lista)
    (defun foreach (resultado lista)
        (if (null lista)
            nil
            (foreach
                (funcall funcao (car lista))
                (cdr lista)
            )
        )
    )
    (foreach (funcall funcao (car lista)) (cdr lista))
)
;(print (for-each #'print (list 1 2 3 4 5)))

; listp verifica se um elemento é uma lista
; nlistp é o contrário
;(defvar numero 1)
;(defvar lista (list 1 2 3))
;(print (listp numero))
;(print (listp lista))

(defun reverter (lista)
    (defun reverter2 (lista lista-invertida)
        (if (null lista)
            lista-invertida
            (reverter2 (cdr lista) (cons (car lista) lista-invertida))
        )
    )
    (reverter2 lista ())
)
;(print (reverter (list 1 2 3 4 5)))


; exercício 2.27
;TODO: usar a função elemento definida em aula13.lisp
(defun reversao-profunda (lista)
    (defun r2 (lista parte-invertida)
        (if (null lista) 
            parte-invertida 
            (r2 (cdr lista) (cons parte-invertida (reverter (car lista))))
        )
    )
    (r2 lista ())
)
(print (reversao-profunda '((1 2) (3 4))))
;(print (reversao-profunda '(1 2 3 4 5)))
