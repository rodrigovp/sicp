; exemplo do capítulo 2.2.3 pag. 102

(defun par? (numero)
    (= (rem numero 2) 0)
)
;(print (par? 3))

(defun impar? (numero)
    (not (par? numero)))
;(print (impar? 3))
;(print (impar? 4))

(defun filtrar (filtro numeros)
    (let ((primeiro-elemento (car numeros)))
        (cond 
            ((null numeros) nil) 
            ((funcall filtro primeiro-elemento) 
                (cons primeiro-elemento (filtrar filtro (cdr numeros)))
            )
            ((filtrar filtro (cdr numeros)))
        )
    )
)
;(print (filtrar #'par? (list 1 2 3 4)))

(defun acumular (acumulador inicial numeros)
    (if (null numeros) inicial 
        (funcall acumulador 
            (car numeros)
            (acumular acumulador inicial (cdr numeros)) 
        )
    )
)
;(print (acumular #'+ 0 (list 1 2 3 4 5)))

(defun sequencia (menor maior)
    (if 
        (> menor maior) nil 
        (cons menor (sequencia (+ menor 1) maior))
    )
)
;(print (sequencia 1 19))

(defun quadrado (numero)
    (expt numero 2)
)

(defun somar-impares-quadrados (numeros)
    (acumular #'+ 0 
        (mapcar #'quadrado 
            (filtrar #'impar? numeros)))
)
;(print (somar-impares-quadrados (list 1 2 3 4 5)))
