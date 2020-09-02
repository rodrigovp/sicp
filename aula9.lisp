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

;(imprimir-ponto 
;    (ponto-do-meio 
;        (criar-segmento 
;            (criar-ponto 1 1) 
;            (criar-ponto 3 3)
;        )
;    )
;)

; exercício 2.3
(defun perimetro-retangulo (ponto-a ponto-c)
    (let ((ponto-b (criar-ponto (coordenada-x ponto-a) (coordenada-y ponto-c)))
          (ponto-d (criar-ponto (coordenada-x ponto-c) (coordenada-y ponto-a))))
        (abs 
            (+
                (- (coordenada-y ponto-b) (coordenada-y ponto-a))
                (- (coordenada-x ponto-c) (coordenada-x ponto-b))
                (- (coordenada-y ponto-c) (coordenada-y ponto-d))
                (- (coordenada-x ponto-d) (coordenada-x ponto-a))
            )
          )
    )
)
;(print (perimetro-retangulo (criar-ponto 1 1) (criar-ponto 0 0)))
;(print (perimetro-retangulo (criar-ponto 10 15) (criar-ponto 20 18)))

; implementação de cons, descrito no capítulo 2.1.3
(defun cons2 (n1 n2)
    (lambda (m)
        (cond ((= m 0) n1)
              ((= m 1) n2)
              ((error "valor de m é ~S e deve ser 0 ou 1." m))
        )
    )
)
(defun car2 (cc)
    (funcall cc 0))

(defun cdr2 (cc)
    (funcall cc 1))
;(print (car2 (cons2 1 2)))
;(print (cdr2 (cons2 1 2)))

; exercício 2.4
(defun cons3 (a b) 
    (lambda (m) (funcall m a b)))

(defun car3 (cc) 
    (funcall cc (lambda (p q) p)))

(defun cdr3 (cc) 
    (funcall cc (lambda (p q) q)))

(print 
    (car3 
        (cons3 1 2)
    )
)
(print 
    (cdr3 
        (cons3 1 2)
    )
)
