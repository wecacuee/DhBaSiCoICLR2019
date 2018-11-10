Thank you for detailed feedback and specific points of concern. 

There are two main reasons for the confusion about the contributions of
this work. Firstly, the specific reward structure for our algorithm is not
mentioned in the paper. Secondly, our reward formulation runs counter to typical
reinforcement learning reward formulations. We clarify the reviewer's concerns and
edit our draft to minimize chances of similar confusion.

Our reward formulation is different from that of Hindsight Experience Replay
(HER). In HER, the agent receives -1 reward for all state transitions except on
reaching the goal when it receives 0 reward. In contrast, for our reward
formulation the agent receives -1 reward for all state transitions including
when agent reaches the goal. In other words, the agent never receives the 0
*goal-reward*. We use the term goal-reward to mean any special reward that agent
receives on reaching the goal. 

Our reward formulation is atypical with respect to conventional Reinforcement Learning
(RL). Conventional RL is formulated with the objective to maximize reward. Hence
a high reward is used to specify the desired goal, called the goal-reward.
However, this goal-reward is not necessary in goal-conditioned RL because the
goal specification is already given at the start of every episode. We use this
idea, to propose a goal-conditioned RL algorithm which learns to reach goals
without using goal-reward. We believe that this result is counter-intuitive and
will be interesting to the RL community.

We have responded to reviewer's concerns point by point and elaborated on the
corresponding changes to the paper.

Clarity:
1. The main difference between HER, FWRL and our algorithm lies in the choice of
   loss terms used. HER uses Eq (3), FWRL uses Eq (3) + L_up + L_lo, and Our
   algorithm uses Eq (3) + L_step as shown in the pseudo-code. Another difference
   is due to reward formulation. Because our rewards are independent of reaching
   the goal, we do not need to recompute rewards. We have added the description
   about these differences in the appendix to highlight these differences.

2. We have introduced the requested citations at appropriate places in the
   paper. 

   Since Kaelbling 1993 introduced the idea of FWRL before Dhiman et. al. 2018,
   we replace the attributions accordingly in the paper. We further add
   discussion points specific to their algorithm in the Related Work section.

Novelty and Significance
1. The shortest path perspective is not our contribution. Our contribution is
   learning *without* using goal-rewards *using* the shortest path perspective.
   Our secondary contribution is to extend Kaelbling 2013 to deep neural
   networks.

2. As mentioned above, our reward structure is different from that used by
   Hindsight Experience Replay (HER) paper. Our reward is always -1 *even when*
   current state is same as the goal state. Also note that just like HER, our
   episodes are of fixed length and do not terminate on reaching the goal.

   To further this in the paper, we have added reward structure
   details to the Introduction (section 1, paragraph 3) and the
   Experiments section (section 5, end of paragraph 1).

3. One-step loss is different from both the terminal step of both Q-Learning and
   Kaelbling 1993[1].

   One-step loss is different from terminal step of Q-Learning because it is
   applied to every state transition rather than just the terminal step of the
   episode. Having said that it is indeed equivalent to Q-Learning, if every
   state transition is viewed as a one-step episode with the reached state as
   the pseudo-goal. There are many ways to look at this algorithm and indeed
   one-step-episode Q-learning is an intuitive way to do so. Correspondingly we
   have updated the manuscript in both the introduction and the one-step loss
   section to include this perspective.

   One-step loss is also different from the terminal step of Kaelbling 1993[1].
   Referring to Section 3 of [1], we see the one-step loss (Eq. 8)
   as an alternative of the terminal condition DG*(s, a, g) = 0 if s = g in the
   recursive definition of DG*(s, a, g). As an alternative, one-step loss 
   translates to DG*(s_t, a_t, g_{t+1}) = -1, for all transitions (s_t, a_t ->
   g_{t+1}) i.e. it removes the dependence of checking s=g. Although it serves
   the same purpose of terminal condition in recursive definition but the
   condition is mathematically different and requires slightly different
   assumption.
   
   Similar to HER, our goal states are not absorbing/terminal. Instead the
   episodes are of fixed number of steps and the agent is encouraged to stay in
   the goal state for as long as possible. This is how the replay buffer is
   populated and how the average episode reward is computed. However, in the
   path-reward formulation the objective maximized is equivalent to treating
   this fixed time step episode problem as if the episodes are terminating on
   reaching the goal.
   
 
4. As stated earlier, our reward structure is always -1 and independent of
   desired goal. The reward re-computation for the pseudo-goals becomes
   unnecessary because the reward does depend upon the current state being the
   desired goal.

   To further highlight saved reward computation, we magnify on our
   reward-computation plots removing the uninformative parts of the plots where
   the curves overlap.

Overall quality:

(A) Novelty
We have two contributions. (a) Showing that goal conditioned value functions can
be learned without using goal rewards. We do this by introducing the one-step
loss function that can be considered to be one-step-episode Q-Learning. As far
as we are aware, this a novel contribution to the Multi-Goal Reinforcement
Learning (b) The extension of Kaelbling 1993 [1] to deep learning domain.


(B) Significance 
There are two main reasons this work is significant. (a) The counter-intuitive
result that goal-conditioned value functions can be learned without needing any
goal reward is worth bringing to the attention of the RL community (b) The
absence of the requirement of reward-recomputation is significant because in
real robotics experiments, the reward recomputation may not be possible without
rerunning the entire experiment. As algorithms continue to build upon HER (107
citations at the point of this writing) it is important that researchers are
aware of the possible trade-offs between the reward recomputation versus
introducing additional loss terms.


We would appreciate your response to the clarifications. We thank you again for your time. 
