Review: This paper presents a reinterpretation of hindsight experience replay (HER) that avoids recomputing the reward function on resampled hindsight goals in favor of simply forcing the terminal state flag for goal-achieving transitions, referred to by the authors as a "step loss".
The new proposal is evaluated on two goal-conditioned tasks from low-dimensional observations, and show modest improvements over HER and a function-approximation version of Floyd-Warshall RL, mostly as measured against the number of times the reward function needs to be recomputed.

Pros:
- minor improvement in computational cost
- investigation of classical FWRL technique in context of deep RL

Cons:
- computational improvement seems very minor
- sparse-reward implementations of HER already do essentially what this paper proposes

Comments:

The main contribution of the paper appears to be the addition of what the authors refer to as a "step loss", which in this case enforces the Q function to correctly incorporate the termination condition when goals are achieved. I.E. the discounted sum of future rewards for states that achieve termination should be exactly equal to the reward at that timestep.

It's not clear to me how this is fundamentally different than HER. One possible "sparse reward" implementation of HER involves no reward function recomputation at all, instead simply replacing the scalar reward and termination flag for resampled transitions with the indicator function for whether the transition achieves the resampled goal.
Is this not essentially identical to the proposal in this paper? I would consider this a task-dependent implementation detail for an application of HER rather than a research contribution that deserves an entire paper.

The authors claim the main advantage here is avoiding recomputation of the reward function for resampled goals.
I do not find this particularly compelling, given that all of the evaluations are done in low-dimensional state space: reward recomputation here is just a low-dimensional euclidean distance computation followed by a simple threshold.
In a world where we're doing millions of forward and backward passes of large matrix multiplications, is this a savings that really requires investigation?
It is somewhat telling that the results are compared primarily in terms of "# of reward function evaluations" rather than wall time. If the savings were significant, I expect a wall time comparison would be more compelling.
Maybe the authors can come up with a situation in which reward recomputation is truly expensive and worth avoiding?

All of the experiments in this paper use a somewhat unusual task setup where every timestep has a reward of -1. Have the authors considered other reward structures, such as the indicator function R=(1 if s==g else 0) or a distance-based dense reward?
Would this proposal work in these cases? If not, how significant is a small change to HER if it can only work for one specific reward function?

Conclusion:

In my view, the main contribution is incremental at best, and potentially identical to many existing implementations of HER.
The reconsideration of Floyd-Warshall RL in the context of deep neural networks is a refreshing idea and seems worth investigating, but I would need to see much more careful analysis before I could recommend this for publication.
Rating: 4: Ok but not good enough - rejection
Confidence: 3: The reviewer is fairly confident that the evaluation is correct
