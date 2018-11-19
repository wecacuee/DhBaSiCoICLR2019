> The main contribution of the paper appears to be ...  equal to the reward at that timestep.

The one-step loss is in fact incorporated for every transition between states, not just the final termination condition when the goal is achieved. To further highlight this information, an alternative perspective of our contribution is that we are learning via one-step episode Q Learning. In the paper we have updated the "one-step loss" section to include this perspective. In other words, the one-step loss' function is to treat every state transition as a terminating condition thus negating the need for special goal-rewards.

> It's not clear to me how this is fundamentally different than HER ... the transition achieves the resampled goal.

All our comparisons are with "sparse reward" implementation of HER. As far as
we can understand, in your formulation the reward should be R(s,a,g) = R(s,a) +
R(s,g), where R(s,g) = (1 if s == g else 0). While such a reward formulation
should indeed work, it still possesses the unnecessary dependence on the goal
which is the emphasis of our work. 

> Is this not essentially identical to the proposal in this paper? ... deserves an entire paper.

No, this is not identical to the paper. At no point in our algorithm do we
check the condition s == g. The proposed one-step loss that learns one-step
reward Q(s_t, a_t, g=s_{t+1}) = r_t as we apply one-step loss to every
transition. One-step loss is therefore task independent.  As mentioned
previously, this can also be thought of as one-step hindsight experience replay
where the achieved goal at every step is treated as the desired goal.

> The authors claim the main advantage here is avoiding recomputation of the reward function for resampled goals ... worth avoiding?

In machine learning, the sample complexity is always distinguished from
computation complexity. The only case where the two are comparable is when the
samples are generated from simulations which is true for HER's formulation, the reward
resampling (or recomputation) is similarly a consequence of performing these
experiments in simulation. 

It is a consequence of this particular reward formulation that it can be
resampled cheaply. While we agree that in these particular task-dependent
reward formulations, this cost is marginal, we still eliminate a redundancy common to the HER algorithm and its derivates. 
With the massive popularity of HER (107 citations and counting), we believe that this is a worthwhile contribution to bring to the attention of the RL community. 

Consider the example of an agent is navigating a maze and the goal is
specified in the form of an image. The semantic comparison of the observed
image with the goal image is an expensive operation that will require 
separate training for goal-dependent reward formulation [1]. However, in our
proposed formulation, the comparison operation in the reward formulation is not needed thereby eliminating 
the need of another learning module. 


> All of the experiments in this paper use a somewhat unusual task setup where every timestep has a reward of -1. 

This is not true. It is true for the experiments that are referred to with the "without goal rewards" or
"Ours" label. All the baselines (HER and FWRL) operate on the reward structure for HER which is R=(0 if s==g else -1). 

> Have the authors considered other reward structures, such as the indicator function R=(1 if s==g else 0) or a distance-based dense reward?
> Would this proposal work in these cases? If not, how significant is a small change to HER if it can only work for one specific reward function?

We have one experiment where we run experiment with the reward structure R=(0 if s==g else -1) which is equivalent. These results can be found in Fig. 4(b), labelled as 
"Ours (goal rewards)". 
Distance-based dense reward is by definition goal dependent. Our contribution is to eliminate this dependence. Hence we do not believe that distance-based reward highlights anything of value about our contribution. We do note that our method when coupled with goal rewards does work (Fig. 4b) amd hence we would expect to continue to work with dense rewards. 


[1] Semi-Parametric Topological Memory for Navigation; Nikolay Savinov, Alexey Dosovitskiy, Vladlen Koltun. ICLR 2018
