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
;(print (escalar-arvore (list 1 (list 2 (list 3 4) 5) (list 6 7)) 10))

; exercício 2.30
(defun elemento (item-lista)
    (if (listp item-lista)(car item-lista) item-lista))

(defun quadrado (arvore)
    (expt (elemento arvore) 2)
)

(defun elevar-ao-quadrado-arvore (arvore)
    (cond
        ((null arvore) nil)
        ((not (consp arvore)) (quadrado arvore))
        ((cons
            (elevar-ao-quadrado-arvore (elemento arvore))
            (elevar-ao-quadrado-arvore (cdr arvore))))
    )
)
; (print (elevar-ao-quadrado-arvore (list 1 (list 2 (list 3 4) 5) (list 6 7))))

; mapcar -> map + car
; consp -> verifica se elemento é um cons
(defun square-tree-map (tree)
  (mapcar 
    (lambda (subtree)
      (if (consp subtree)
        (square-tree-map subtree)
        (quadrado subtree)))
    tree))
(print (square-tree-map (list 1 (list 2 (list 3 4) 5) (list 6 7))))

; exercício 2.31
; define (square-tree tree) (tree-map square tree))
