Thanks for the detailed review.

Clarity:
1. The main difference between HER, FWRL and Our algorithm lies in the choice of
   Loss terms used. HER uses Eq (3), FWRL uses Eq (3) + L_{up} + L_{lo},
   while Our algorithm uses Eq (3) + L_{step} as shown in the pseudo-code.
2. We have introduced the requested citations at appropriate places in the paper.

Novelty and Significance
1. The shortest path perspective is not our contribution. Our contribution is
   learning *without* using goal rewards *using* shortest path perspective.
   Our secondary contribution is to extend Kaelbling 2013 to deep neural
   networks.

2. Our reward structure is different from that used by Hindsight Experience
   Replay (HER) paper.
   Our reward is always -1 *even when* current state is same as
   the goal state. 

   There is a miss-understanding between no goal-reward and zero goal-reward. In
   the HER paper reward structure, the "0" reward given on reaching the goal,
   hence zero goal-reward. In our formulation the reward is always "-1" with no
   special reward on reaching the goal, hence no goal-reward. The main advantage
   of our formulation that our reward function does not depend upon the goal
   state at all. Our reward is always -1 irrespective of the desired goal state.
   To make this clear we have added a clarifying line about our
   reward-formulation at the end of Para 1 of Section 5.

3. Our algorithm is a deep learning extension of [1], which is a tabular formulation.
   We see the one-step loss (Eq. 8) as a variation of the terminal condition
   DG*(s, a, g) = 0 if s = g in the recursive definition of DG*(s, a, g)
   (Section 3 of [1]).
   One-step loss is new because it is translates to DG*(s_t, a_t, g_{t+1}) = 1,
   for all transitions (s_t, a_t -> g_{t+1}).
   Although it serves the same purpose of terminal condition in recursive
   definition but the condition is mathematically different and requires
   slightly different assumption. Similar to HER, our goal states are not
   absorbing/terminal. Instead the agent is encouraged to stay in the goal state
   for as long as possible for highest reward.
   One-step loss is not terminal step of Q-learning because it is applicable to
   all transitions rather the terminal step. Having said that, the one-step loss
   is indeed *equivalent* to Q-learning if all steps are treated are one-step
   episodes with the reached goal as the pseudo-goal. There are many ways to
   look at an algorithm and one-step pseudo-goal Q-learning is one more way to
   look at the proposed algorithm but we believe that it is still novel as it
   has not been done before and is advantageous over the baseline.

4) This point is addressed by point (2). Since our reward structure is always -1
  and independent of goal-reward, the reward re-computation for the pseudo-goals
  becomes unnecessary.
