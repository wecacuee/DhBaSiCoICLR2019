This paper aims to improve on Hindsight Experience Replay by removing the need to compute rewards for reaching a goal. The idea is to frame goal-reaching as a shortest path problem where all rewards are -1 until the goal is reached, removing the need to compute rewards. While similar ideas were explored in a recent arxiv tech report, this paper claims to build on these ideas with new loss functions. The experimental results do not seem to be any better compared to baselines when measured in terms of data efficiency, but the proposed method requires fewer “reward computations”.

Clarity:
While the ideas in the paper were easy to follow, there are a number of problems with the writing. The biggest problem is that it wasn’t clear exactly what algorithms were evaluated in the experiments. There is an algorithm box for the proposed method in the appendix, but it’s not clear how the method differs from the FWRL baseline.

Another major problem is that the paper does a poor job of citing earlier related work on RL. DQN is introduced without mentioning or citing Q-learning. Experience replay is mentioned without citing the work of Long-Ji Lin. There’s no mention of earlier work on shortest-path RL from LP Kaelbling from 1993. 

Novelty and Significance:
After reading the paper I am not convinced that there’s anything substantially new in this paper. Here are my main concerns:

1) The shortest path perspective for goal-reaching was introduced in “Learning to Achieve Goals” by LP Kaelbling [1]. This paper should be cited and discussed.

2) I am not convinced that the proposed formulation is any different than what is in Hindsight Experience Replay (HER) paper. Section 3.2 of the HER paper defines the reward function as -1 if the current state is not the same as the goal and 0 if the current state is the same as the goal. Isn’t this exactly the cost-to-go/shortest path reward structure that is used in this paper?

3) This paper claims that the one-step loss (Equation 8) is new, but it is actually the definition of the Q-learning update for transitioning to a terminal state. Since goal states are absorbing/terminal, any transition to a goal state must use the reward as the target without bootstrapping. So the one-step loss is just Q-learning and is not new. This is exactly how it is described in Section 3 of [1].

4) The argument that the proposed method requires fewer reward evaluations than FWRL or HER seems flawed. HER defines the reward to be -1 if the current state and the goal are different and 0 if they are the same. As far as I can tell this paper uses the same reward structure, so how is it saving any computation?

Can the authors comment on these points and clarify what they see as the novelty of this work?

Overall quality:
Unless the authors can convince me that the method is not equivalent to existing work I don’t see enough novelty or significance for an ICLR paper.

[1] “Learning to Achieve Goals” LP Kaelbling, 1993.
Rating: 1: Trivial or wrong
Confidence: 4: The reviewer is confident but not absolutely certain that the evaluation is correct
