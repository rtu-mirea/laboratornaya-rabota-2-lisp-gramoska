(defun compress (lst &optional (current (car lst)) (len 1) tail)
    (cons (if (= current (cadr lst))
            (list (setq len (loop for i in lst when (/= i current) 
                do (loop-finish) count t)) current) current)
        (if (setq tail (subseq lst len)) (compress tail))))

(defun decompress(lst)
    (loop for item in lst
        if (integerp item) collect item
        if (listp item) nconc (make-list (car item) :initial-element (cadr item))))

(print (compress (list 1 1 1 1 0 1 0 0 0 0 0 0 1 1)))
(print (decompress (list (list 4 1) 0 1 (list 6 0) (list 2 1))))