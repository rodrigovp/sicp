; exemplo do capítulo 2.2.3

(defun eh-par (numero)
    (= (rem numero 2) 0)
)
;(print (eh-par 3))

;; no livro, está função chama-se simplesmente 'filter'
(defun aplica-qualquer-filtro (filtro numeros)
    (let ((primeiro-elemento (car numeros)))
        (cond 
            ((null numeros) nil) 
            ((funcall filtro primeiro-elemento) 
                (cons primeiro-elemento (aplica-qualquer-filtro filtro (cdr numeros)))
            )
            ((aplica-qualquer-filtro filtro (cdr numeros)))
        )
    )

)
(print (aplica-qualquer-filtro #'eh-par (list 1 2 3 4)))

;; no livro, esta função chama-se simplesmente 'accumulate'
;(defun aplica-qualquer-acumulador (acumulador numeros)

;)