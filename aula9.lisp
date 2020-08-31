; manipulação de listas

(defun obter-restante (lista)
    (cdr lista))
;(write (obter-restante '(1 2 3 4)))
(terpri)

(defun obter-primeiro-elemento (lista)
    (car lista))
;(write (obter-primeiro-elemento '(1 2 3 4 5)))
;(terpri)

(defvar x (cons 1 2))
(defvar y (cons 3 4))
(defvar z (cons x y))
;(print z)

; exercício 2.2
(defun criar-ponto (x y) (cons x y))
(defun coordenada-x (ponto) (car ponto))
(defun coordenada-y (ponto) (cdr ponto))

(defun criar-segmento(ponto-a ponto-b) 
    (cons ponto-a ponto-b)
)
(defun inicio-segmento (segmento) (car segmento))
(defun fim-segmento (segmento) (cdr segmento))

(defun media (a b) (/ (+ a b) 2))
(defun media-x (segmento)
    (media
        (coordenada-x(inicio-segmento segmento))
        (coordenada-x(fim-segmento segmento))
    )
)
(defun media-y (segmento)
    (media
        (coordenada-y(inicio-segmento segmento))
        (coordenada-y(fim-segmento segmento))
    )
)

(defun ponto-do-meio (segmento)
    (criar-ponto (media-x segmento) (media-y segmento))
)

; TODO: como imprimir:
; -> de forma mais simples
; -> e que o resultado da impressão seja mais amigável?
(defun imprimir-ponto (ponto)
    (write-line "(")
    (print (coordenada-x ponto))
    (write-line ",")
    (print (coordenada-y ponto))
    (write-line ")")
)

(imprimir-ponto 
    (ponto-do-meio 
        (criar-segmento 
            (criar-ponto 1 1) 
            (criar-ponto 3 3)
        )
    )
)