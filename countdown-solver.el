;;; countdown-solver.el --- Solver for Countdown Numbers Game -*- lexical-binding: t; -*-

(defgroup countdown-solver nil
  "Countdown numbers game solver."
  :group 'games
  :prefix "countdown-")

(defcustom countdown-large-numbers '(25 50 75 100)
  "The set of large numbers available in the game. (25, 50, 75, 100)"
  :type '(repeat integer)
  :group 'countdown-solver)

(defcustom countdown-small-numbers (append (number-sequence 1 10)
                                           (number-sequence 1 10))
  "The set of small numbers available in the game (1-10, each appearing twice)."
  :type '(repeat integer)
  :group 'countdown-solver)


(defun countdown-generate-target ()
  "Generate a random target number between 100 and 999."
  (+ 100 (random 900)))


;; https://gist.github.com/purcell/34824f1b676e6188540cdf71c7cc9fc4
(defun countdown--shuffle-list (list)
  "Shuffles LIST randomly, modying it in-place."
  (dolist (i (reverse (number-sequence 1 (1- (length list)))))
    (let ((j (random (1+ i)))
	  (tmp (elt list i)))
      (setf (elt list i) (elt list j))
      (setf (elt list j) tmp)))
  list)


(defun countdown-generate-numbers (num-large)
  "Generate a list of 6 numbers for the game with NUM-LARGE large numbers."
  (let* ((large-pool (countdown--shuffle-list (copy-sequence countdown-large-numbers)))
         (small-pool (countdown--shuffle-list (copy-sequence countdown-small-numbers)))
         (large-nums num-large)
	 (small-nums (- 6 large-nums))
	 (target-numbers '()))
    ;; (princ large-pool)
    ;; (princ small-pool)
    ;; pick NUM-LARGE numbers from the (previously shuffled) large number pool
    (dotimes (i large-nums)
      (push (pop large-pool) target-numbers))
    ;; pick 6-NUM-LARGE numbers from the (previously shuffled) small number pool
    (dotimes (i small-nums)
      (push (pop small-pool) target-numbers))
    ;; (princ large-pool)
    ;; (princ small-pool)
    ;; (print target-numbers)
    ;; reverse since we pop-ed from front to end of current list
    ;; also this returns target-numbers at function call then
    (reverse target-numbers)
    )
  )

(countdown-generate-numbers 2)


;; (pop) remove first element of list, and return the returned element 



(length '(1 2 3))
(reverse (number-sequence 1 5))



