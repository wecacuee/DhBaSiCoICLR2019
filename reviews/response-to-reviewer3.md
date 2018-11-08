There are two main reasons for the confusion about the contributions of
this work. 

First, our reward formulation is different from that of Hindsight Experience Replay
(HER). In HER, the agent receives -1 reward for all state transitions except on
reaching the goal when it receives 0 reward. In contrast, for our reward
formulation the agent receives -1 reward for all state transitions including
when agent reaches and continues to stay at the goal.

Second, our reward formulation is atypical with respect to conventional
Reinforcement Learning (RL). In conventional RL, a high reward is used to
specify the desired goal (goal-reward). However, this goal-reward is not
necessary in goal-conditioned RL because the goal specification is already given
at the start of every episode. We believe that this result is counter-intuitive
and will be interesting to the RL community.

We clarify the reviewer's concerns and
edit our draft to minimize chances of similar confusion.

Clarity:
1. The main difference between HER, FWRL and our algorithm lies in the choice of
   loss terms used. HER uses Eq (3), FWRL uses Eq (3) + L_up + L_lo, and Our
   algorithm uses Eq (3) + L_step as shown in the pseudo-code. Another difference
   is due to reward formulation. Because our rewards are independent of reaching
   the goal, we do not need to recompute rewards. We have added the description
   about these differences in the appendix to highlight them.

2. We have introduced the requested citations at appropriate places in the
   paper. 

   Since [1] introduced the idea of FWRL before Dhiman et. al. 2018,
   we replace the attributions accordingly in the paper. We further add
   discussion points specific to their algorithm in the Related Work and
   One-Step Loss section.

Novelty and Significance
1. Our contribution is learning *without* using goal-rewards *using* the
   shortest path perspective. Our secondary contribution is to extend [1] to
   deep neural networks.

2. As mentioned above, our reward is always -1 *even when* current state is same
   as the goal state. 

   Similar to HER, our goal states are not absorbing/terminal. Instead the
   episodes are of fixed number of steps and the agent is encouraged to stay in
   the goal state for as long as possible. This is how the replay buffer is
   populated and how the average episode reward is computed. However, the
   objective maximized is equivalent to treating this fixed length episode
   problem as if the episodes are terminating on reaching the goal.

   To further clarify this in the paper, we have added reward structure
   details to the Introduction (section 1, paragraph 3) and the
   Experiments section (section 5, end of paragraph 1).

3. One-step loss is different from both the terminal step of both Q-Learning and [1].

   One-step loss is different from terminal step of Q-Learning because it is
   applied to every state transition rather than just the terminal step of the
   episode. Having said that it is indeed equivalent to Q-Learning, if every
   state transition is viewed as a one-step episode with the reached state as
   the pseudo-goal. Correspondingly we have updated the manuscript in both the
   introduction and the one-step loss section to include one-step-episode
   Q-Learning perspective.

   One-step loss is also different from the terminal step of [1].
   Referring to Section 3 of [1], we see the one-step loss (Eq. 8)
   as an alternative of the terminal condition DG*(s, a, g) = 0 if s = g in the
   recursive definition of DG*(s, a, g). As an alternative, one-step loss 
   translates to DG*(s_t, a_t, g_{t+1}) = -1, for all transitions (s_t, a_t ->
   g_{t+1}) i.e. it removes the dependence of checking s=g. Although it serves
   the same purpose of terminal condition in recursive definition but the
   condition is mathematically different and requires the different
   assumption that one-step path is the highest reward path between s_t and g_{t+1}. 
   
 
4. As stated earlier, our reward independent of desired goal. The reward
   re-computation for the pseudo-goals becomes unnecessary because the reward
   does depend upon the check if current state is same as the desired goal.

   To further highlight saved reward computation, we magnify on our
   reward-computation plots removing the uninformative parts of the plots where
   the curves overlap.

Overall quality:

(A) Novelty: As argued above our proposed one-step loss is novel and so is the
extension of [1] from tabular domain to deep learning.

(B) Significance 
  (a) The counter-intuitive result that goal-conditioned RL does not need goal
  reward is worth bringing to the attention of the RL community
  (b) The absence of the requirement of reward-recomputation is significant
  because in real robotics experiments, the reward computation may not be
  possible without re-running the entire experiment.

[1]: Kaelbling, Leslie Pack. "Learning to achieve goals." IJCAI. 1993.
