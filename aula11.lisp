; exercício livre
(defun soma-elementos (lista)
    (defun soma-elementos2 (lista resultado)
        (if (null lista)
            resultado
            (soma-elementos2 (cdr lista) (+ resultado (car lista)))
        )
    )
    (soma-elementos2 lista 0)
)
; (print (soma-elementos (list 1 2 3 4 5)))

; exemplo do exercício 2.20 (uso do dotted-tail notation, não suportada 
; pelo common lisp)
(defun usando-&rest (x y &rest z)
    (print x)
    (print y)
    (print z))
; (usando-&rest 1 2 3 4)

; exercício livre, usando &rest
(defun soma-elementos-usando-&rest (&rest lista)
    (soma-elementos lista))
;(print (soma-elementos-usando-&rest 1 2 3 4 5))

; exercício 2.20 
(defun mesma-paridade (elem &rest others)
  (let ((result (list elem)))
    (dolist (other others)
      (when (= (rem elem 2) (rem other 2))
        (setf result (append result (list other)))))
    result))
; (print (mesma-paridade 2 3 4 5 6))

; falta testar o caso em que cabeca seja nula, e corrigir
(defun mesma-paridade-recursivo (elem &rest outros)
    (defun mesma-paridade (elem outros resultado)
        (print resultado)
        (let 
            ((cabeca (car outros)))
            (if (= (rem cabeca 2) (rem elem 2))
                (setf resultado (append resultado (list cabeca)))
            )
            (mesma-paridade elem (cdr outros) resultado)
        )
    )
    (let ((resultado (list elem)))
        (if (null outros)
            resultado
            (mesma-paridade elem outros resultado)
        )
    )

)
(print (mesma-paridade-recursivo 4 5 6 7 8 9))


; item 2.2.1 - Maps
(defun escalar (itens fator)
    (if 
        (null itens) nil
        (cons (* (car itens) fator) (escalar (cdr itens) fator))))
; (print (escalar (list 1 2 3) 4))

; função existente na lib padrão do CL (com lista de argumentos diferente)
;(defun map (proc itens)
;    (if (null itens)
;        nil
;        (cons 
;            (funcall proc (car itens))
;            (map proc (cdr itens))
;        )
;    )
;)
;(print 
;    (map 
;        (lambda (x) (* x x)) 
;        (list 1 2 3)))