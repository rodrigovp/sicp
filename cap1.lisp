;
; Contém exercícios do cap 1, bem como alguns testes livres.
;

(defvar size 2) ; igual ao define do scheme
(defun quadrado(x) (* x x))
(defun p(x) (print x)) ; alias para a função print
(defvar fator1 3)
(defvar fator2 4)

; função composta
(defun soma-de-quadrados(x y) 
	(+ (quadrado x) (quadrado y)))

; maneiras de formatar uma linha de código, 
; tendo como objetivo a facilidade de leitura
(print 
	(+ 
		21 35 12 7))

(print (* 2 size))

(p (quadrado 2))
(p (* fator1 fator2))
(p (soma-de-quadrados 2 3))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; teste de condicionais
(defvar numero 4)
(defun igual-a-cinco?(numero) (= numero 5))
(cond 
	((igual-a-cinco? numero) (p numero))
	((< numero 5) (p (- numero 1)))
	((> numero 5) (p (+ numero 1))))

(p (igual-a-cinco? 4))
(p (igual-a-cinco? 5))
(p (igual-a-cinco? 6))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; isso cobre até o item 1.1.6
; Exercício 1.3
(defun maior(a b) 
	(cond
		((= a b) a)
		((> a b) a)
		((< a b) b)
	)
)
(p (maior 3 2))

(defun quadrado-do-maior(x y) 
	(quadrado (maior x y))
)
(p (quadrado-do-maior 5 4))

(defun soma-de-quadrados-dois-maiores(a b c) 
(+
	(quadrado-do-maior a b) 
	(quadrado-do-maior (maior a b) c)
))
(p (soma-de-quadrados-dois-maiores 3 4 5))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sub título 1.1.7
(defun media(guess x) (/ (+ guess x) 2))
(p (media 10 0))

(defun improve(guess x) 
	(media guess (/ x guess))
)

(defun bom-o-suficiente?(guess x)
	(< (abs (- (quadrado guess) x)) 0.001)
)
(p (bom-o-suficiente? 1 2))

(defun raiz-quadrada-iterativa(guess x)
	(if (bom-o-suficiente? guess x)
		guess
		(raiz-quadrada-iterativa (improve guess x) x)
	)
)
(p (raiz-quadrada-iterativa 1.0 2))
