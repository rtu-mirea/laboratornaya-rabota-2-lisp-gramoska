(defun fileread (textfile)
    (let ((in (open textfile :if-does-not-exist nil)))
        (when in
            (loop for line = (read-line in nil)
                while line do (format t "~a~%" line))
        (close in)))
)

(fileread "2.txt")