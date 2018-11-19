> The main contribution of the paper appears to be ...  equal to the reward at that timestep.

The one-step loss is, in fact, incorporated for every transition between states, not just the termination condition when the goal is achieved. An alternative perspective of one-step loss is one-step-episode Q-Learning. In other words, the one-step loss function is equivalent to treating every state transition as a full episode and the terminating condition. In the paper we have updated the "one-step loss" section to include this perspective. 

> It's not clear to me how this is fundamentally different than HER ... the transition achieves the resampled goal.

All our comparisons are already with "sparse reward" R(s,a,g) = (0 if s == g else -1) implementation of HER. As far as we can understand, in your proposed formulation the reward should be R(s,a,g) = (1 if s == g else 0) which is shifted by a constant factor. The sparse reward formulation still possesses the unnecessary dependence on the goal whose redundancy and removal is the emphasis of our work.

> Is this not essentially identical to the proposal in this paper? ... deserves an entire paper.

No, this is not identical to the paper. At no point in our algorithm do we check the condition s == g. The proposed one-step loss that learns one-step reward Q(s_t, a_t, g=s_{t+1}) = r_t as we apply one-step loss to every transition. One-step loss is therefore task independent. As mentioned previously, this can also be thought of as one-step hindsight experience replay where the achieved goal at every step is treated as the desired goal.

> The authors claim the main advantage here is avoiding recomputation of the reward function for resampled goals ... worth avoiding?

In machine learning, the sample complexity is always distinguished from computation complexity. The only case where the two are comparable is when the samples are generated from simulations which is, admittedly, true for our experiments. However, our proposed improvement is general enough to be applicable to non-simulation experiments.

It is a consequence of this task-dependent reward formulation that it can be re-sampled cheaply, hence, the computational cost is improvement is marginal. But we eliminate a redundancy common to the HER algorithm and its derivatives. With the massive popularity of HER (107 citations and counting), we believe that this is a worthwhile contribution to bring to the attention of the RL community. 

Consider the example of an agent navigating a maze where the goal is specified in the form of an image. The semantic comparison of the observed image with the goal image is an expensive operation that will require separate training for goal-dependent reward formulation [1]. However, in our proposed formulation, the comparison operation (s == g) in the reward formulation is not needed thereby eliminating the need of another learning module. 


> All of the experiments in this paper use a somewhat unusual task setup where every timestep has a reward of -1. 

This unusual reward formulation is possible because of our contribution (one-step loss). Hence, it is only true for the experiments that are referred to with "Ours" label. All the baselines (HER and FWRL) and "Ours (goal rewards)" operate on the reward structure for HER which is R=(0 if s==g else -1).

> Have the authors considered other reward structures, such as the indicator function R=(1 if s==g else 0) or a distance-based dense reward?
> Would this proposal work in these cases? If not, how significant is a small change to HER if it can only work for one specific reward function?

We have considered and we are advocating against such reward structures because of their goal dependence. In fact in one experiment we run our algorithm with the reward structure R=(0 if s==g else -1) which is equivalent to yours with a constant shift. These results can be found in Fig. 4(b), labeled as "Ours (goal rewards)". 

Distance-based dense reward is by definition goal dependent. Our contribution is to eliminate this dependence. RL on dense rewards is easier than sparse rewards. Hence, we do not believe that distance-based reward adds much to our contribution. We do note that our method does work with goal based sparse rewards(Fig. 4b) and hence we would expect to continue to work with dense rewards. 

> The reconsideration of Floyd-Warshall RL ... recommend this for publication.

We analyze FWRL and added the ablation study of loss function in Appendix Figure 6.
It is clear that FWRL inspired loss function do not contribute to better
learning. Instead, they hurt the performance. We think this is because Bellman inspired loss already captures the information that FWRL inspired constraints intend to capture.

[1] Nikolay Savinov, Alexey Dosovitskiy, Vladlen Koltun. "Semi-Parametric Topological Memory for Navigation". In ICLR 2018
