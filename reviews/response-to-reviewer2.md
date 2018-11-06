Thanks for the review.

1. The experimental results are mixed, and do not convincingly demonstrate the
   effectiveness/superiority of the proposed method.

The results are mixed when the learning curves are with respect to transition
samples. However, our algorithm comprehensively improves upon the baseline HER
when measured in terms of reward samples. We believe this is a significant
simplification of HER in terms of reward sample complexity. Reward recomputation
cost can be significant dependent upon the environment and setup. In cases when
the reward-computation depends upon collisions and haptic feedback of real
robots, the reward recomputation may even be impossible without re-running the
experiment. Hence reducing reward-computation based on a simple loss term is an
important contribution.


2. The idea of the proposed method is relatively simple, and is not theoretically justified.

We believe the simplicity of our proposed idea is the beauty of our method leading to significant change in performance of the algorithm.
Because of the simplicity of the idea, the theoretical justification required for the algorithm is minimal.
   

