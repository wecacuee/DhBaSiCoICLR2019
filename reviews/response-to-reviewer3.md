Thank you for detailed feedback and specific points of concern. 

There are two main reasons for the miscommunication of the contributions of this work: 
(a) There is a lack of information about our specific reward structure and how it
differs from HER. (b) The formulation is not intuitive running counter to how
reinforcement learning algorithms traditionally work. 

In HER, the agent receives -1 reward for normal state transitions while
achieving 0 reward at the goal location. In contrast, our algorithm continues
to receive -1 reward even if the current state is the same as the goal state
even when the episode does not terminate on reaching the goal.  In other words,
there is no mechanism for receiving the 0 *goal-reward* at any point in any
episode.  We emphasize that 0 goal-reward and the absence of goal reward are
not the same. 

For the second point, the objective of Reinforcement Learning is to maximize
reward. To incentivize agents to reach goals, one associates the goals with
higher relative reward. Thereby when the agent reaches the goal states, it
achieves the RL objective of maximizing reward. The main contribution of this
paper is the result that shows that this *goal-reward* is not needed for
goal-conditioned reinforcement learning. We believe that this result is
counter-intuitive and deserves the attention of the RL community.

We have further responded to your specific points of concern below. For each
point we have made changes to the manuscript which as also highlighted. 

Clarity:
1. The main difference between HER, FWRL and our algorithm lies in the choice
   of loss terms used. HER uses Eq (3), FWRL uses Eq (3) + L_{up} + L_{lo}, and
   our algorithm uses Eq (3) + L_{step} as shown in the pseudo-code. We have modified the 
   pseudo-code in the appendix 
   to further highlight these differences in terms of the loss terms used and
   the point at which reward recomputation would traditionally occur in the HER
   algorithm.

2. We have introduced the requested citations at appropriate places in the
   paper. Since Kaelbling 1993 introduced the idea of FWRL before Dhiman et. al.
   2018, we replace the attributions accordingly in the paper. We further add
   discussion points specific to their algorithm in the Related Work section. 

Novelty and Significance
1. The shortest path perspective is not our contribution. Our contribution is
   learning *without* using goal rewards *using* the shortest path perspective.
   Our secondary contribution is to extend Kaelbling 2013 to deep neural
   networks.

2. As mentioned above, our reward structure is different from that used by
   Hindsight Experience Replay (HER) paper.  Our reward is always -1 *even when*
   current state is same as the goal state when the episode is still to be
   terminated. To further emphasize in the manuscript, we have added reward
   structure details to the Introduction (section 1, end of paragraph 3) and the Experiments
   section (section 5, end of paragraph 1).  

   There is a misunderstanding between no goal-reward and zero goal-reward. In
   the HER reward structure, "0" reward given on reaching the goal,
   hence zero goal-reward. In our formulation the reward is always "-1" with no
   special reward on reaching the goal, hence no goal-reward. The main advantage
   of our formulation that our reward function does not depend upon the goal
   state at all. Our reward is always -1 irrespective of the desired goal state.

3. One-step loss is different from both the terminal step of both Q-Learning. This is because it is applied at every state transition
   rather than just the terminal step of the episode. Under the perspective that
   every state transition is treated as a one-step episode with the reached state
   as the pseudo-goal, then one-step loss is equivalent to Q-Learning.  There are
   many ways to look at this algorithm and indeed one-step-episode Q-learning
   is an intuitive way to do so. Correspondingly we have updated the manuscript in
   both the introduction and the one-step loss section to include this
   perspective. 

   One-step loss is also different from Kaelbling 1993[1]. Specifically,
   considering Section 3 of [1], we see the one-step loss (Eq. 8) as a variation
   of the terminal condition DG*(s, a, g) = 0 if s = g in the recursive definition
   of DG*(s, a, g).  One-step loss is new because it is translates to DG*(s_t,
   a_t, g_{t+1}) = -1, for all transitions (s_t, a_t -> g_{t+1}) i.e. it removes
   the dependence of s=g.  Although it serves the same purpose of terminal
   condition in recursive definition but the condition is mathematically different
   and requires slightly different assumption. 
   
   Similar to HER, our goal states are
   not absorbing/terminal. Instead the agent is encouraged to stay in the goal
   state for as long as possible. We have also updated the
   manuscript to include these technical details in the one-step loss section. 
   
 
4. This point is addressed by point (2). Since our reward structure is always
   -1 and independent of goal-reward, the reward re-computation for the
   pseudo-goals becomes unnecessary because the reward does depend upon the
   current state being the desired goal. Due to this independence the reward does
   not need to be recomputed for pseudo-goals thereby saving computation. 

   To further highlight saved reward computation, we magnify on our
   reward-computation plots removing the uninformative parts of the plots where
   the curves overlap.

Overall quality:

(A) Novelty
We have two contributions. (a) Showing that goal conditioned value functions can be learned without using goal rewards. We do this by introducing the one-step loss function that can be considered to be one-step-episode Q-Learning. As far as we are aware, this a novel contribution to the Multi-Goal Reinforcement Learning  (b) The extension of Kaelbling 1993 [1] to deep learning domains. 


(B) Significance 
There are two main reasons this work is significant. (a) The counter-intuitive result that goal-conditioned value functions can be learned without needing any goal reward is worth bringing to the attention of the RL community (b) The absence of the requirement of reward-recomputation is significant because in real robotics experiments, the reward recomputation may not be possible without rerunning the entire experiment. As algorithms continue to build upon HER (107 citations at the point of this writing) it is important that researchers are aware of the possible trade-offs between the reward recomputation versus introducing additional loss terms. 


We would appreciate your response to the clarifications we have made. We thank you again for your time. 
