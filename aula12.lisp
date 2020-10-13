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

; exercício 2.27
