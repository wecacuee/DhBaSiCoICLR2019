Thank you for your feedback. 

1. The experimental results are mixed, and do not convincingly demonstrate the
   effectiveness/superiority of the proposed method.

The results are mixed when the learning curves are compared with respect to the epochs (the number of transition samples) that intentionally does not take reward-recomputation in to account. 

When this computation is taken in to account, our algorithm comprehensively improves upon the baselines in 6 out of 8 experiments. To further highlight these differences we magnify our reward-recomputation plots to eliminate sections where curves overlap and are non-informative. These changes can be found in Figure 2 and 3.  

We further reiterate that reward recomputation
cost can be significant dependent upon the environment and setup. In cases when
the reward-computation depends upon collisions and haptic feedback of real
robots, the reward recomputation may even be impossible without re-running the
experiment. Hence reducing reward-computation based on a simple loss term is an
important contribution.


2. The idea of the proposed method is relatively simple, and is not theoretically justified.

The main contribution of this paper is to show that goal-conditioned value functions can be learned without requiring goal-reward.
We believe that the simplicity of this proposed idea is the beauty of the method leading to significant changes in performance of the algorithm when reward recomputation is taken in to account.

Our algorithm builds upon HER which does not itself possess theoretical guarantees. We would be able to addess this point specifically if the reviewer could clarify what kind of theoretical justification they would expect to see. 
   
