; parte do capítulo 2.2.1 (criação de listas)
(defvar uma-lista (list 1 2 4 6))
;(print uma-lista)
;(print (car uma-lista))
;(print (cadr uma-lista))
;(print (cddr uma-lista))
;(print (cons 10 uma-lista))

(defun obter-n-esimo(lista n)
    (if (= n 0)
        (car lista)
        (obter-n-esimo (cdr lista) (- n 1))))
;(print (obter-n-esimo (list 1 2 3 4) 5))

(defun tamanho(lista)
    (if (null lista)
        0
        (+ 1 (tamanho (cdr lista)))
    )
)
;(print (tamanho uma-lista))

; já existe uma função append no common-lisp, e criar outra de mesmo nome causa conflito
(defun append2(lista1 lista2)
    (if (null lista1)
        lista2
        (cons (car lista1) (append2 (cdr lista1) lista2))
    )
)
;(print (append2 (list 1 2 3 4) (list 5 6 7 8)))

; exercício 2.17
(defun ultimo-par(lista)
    (defun ultimo-par2(lista numero)
        (let ((cabeca (car lista))
              (cauda (cdr lista)))
            (cond
                ((null lista) numero)
                ((= (mod cabeca 2) 0) (ultimo-par2 cauda cabeca))
                ((ultimo-par2 cauda numero))
            )
        )
    )
    (ultimo-par2 lista nil)
)
(print (ultimo-par (list 1 2 3 4 5)))

(defun testar-let()
    (let ((a 55)) 
        (print a))
)
