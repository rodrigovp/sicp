; consp é idêntica à função pair? do scheme
(defun testar-par (a b)
    (let ((um-par (cons a b)))
        (print (consp um-par))
    )
)
;(testar-par 1 2)

; estruturas hierárquicas Item 2.2.2
(defun escalar-arvore (arvore fator)
    (cond 
        ((null arvore) nil)
        ((not (consp arvore)) (* arvore fator))
        ((cons 
            (escalar-arvore (car arvore) fator)
            (escalar-arvore (cdr arvore) fator)))
    )
)
(print (escalar-arvore (list 1 (list 2 (list 3 4) 5) (list 6 7)) 10))