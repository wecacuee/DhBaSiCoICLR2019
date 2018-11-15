Thanks for the detailed review.

> The main contribution of the paper appears to be the addition of what the authors refer to as a "step loss", which in this case enforces the Q function to correctly incorporate the termination condition when goals are achieved. I.E. the discounted sum of future rewards for states that achieve termination should be exactly equal to the reward at that timestep.

You got it right, except the one-step loss is incorporated for every transition not just the final transition when goal is achieved.

> It's not clear to me how this is fundamentally different than HER. One possible "sparse reward" implementation of HER involves no reward function recomputation at all, instead simply replacing the scalar reward and termination flag for resampled transitions with the indicator function for whether the transition achieves the resampled goal.

All our comparisons are with "sparse reward" implementation of HER. We do not
compare against dense reward implementation of HER. What I understand from your
formulation is that reward should be R(s,a,g) = R(s,a) + R(s,g), where 
R(s,g) = (1 if s == g else 0). Whenever the goal location changes, R(s,g) will always be
easy to compute no matter how expensive R(s,a) is.

> Is this not essentially identical to the proposal in this paper? I would consider this a task-dependent implementation detail for an application of HER rather than a research contribution that deserves an entire paper.

No, this is not identical to the paper. At no point in our algorithm we check
the condition s == g. The proposed one-step loss that learns one-step reward 
Q(s_t, a_t, g=s_{t+1}) = r_t is independent of whether the goal has been reached
or not, because we apply the one-step loss to every transition.
This principle is not tasks-dependent but task independent.
This can also be thought of as one-step hindsight experience replay where the
achieved goal is treated as the desired goal.

> The authors claim the main advantage here is avoiding recomputation of the reward function for resampled goals.
> I do not find this particularly compelling, given that all of the evaluations are done in low-dimensional state space: reward recomputation here is just a low-dimensional euclidean distance computation followed by a simple threshold.
> In a world where we're doing millions of forward and backward passes of large matrix multiplications, is this a savings that really requires investigation?
> It is somewhat telling that the results are compared primarily in terms of "# of reward function evaluations" rather than wall time. If the savings were significant, I expect a wall time comparison would be more compelling.
> Maybe the authors can come up with a situation in which reward recomputation is truly expensive and worth avoiding?

In machine learning, the sample complexity is evaluated separately from
computation complexity. Only when the samples are generated from simulation can
the sample complexity be compared with computational complexity. It is a
consequence of simulation reward function can be re-sampled (or recomputed). 
It is a consequence of this particular reward formulation that it can be
computed cheaply.
Suppose the algorithm is being applied to a real robot instead. The robot gets
negative reward on hitting an obstacle like the table. The reward
re-sampling in this case is equivalent of repeating the experiment.


> All of the experiments in this paper use a somewhat unusual task setup where every timestep has a reward of -1. 
Not all the experiments. Only the experiments "without goal rewards" labeled
("Ours"). The reward structure for HER is R=(0 if s==g else -1). 
> Have the authors considered other reward structures, such as the indicator function R=(1 if s==g else 0) or a distance-based dense reward?
We have one experiment where we run experiment with the reward structure R=(0 if s==g else -1).


> Would this proposal work in these cases? If not, how significant is a small change to HER if it can only work for one specific reward function?
It works with multiple kind of reward functions.

