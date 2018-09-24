# -*- vim: set textwidth=0 -*-
rsync -rav --include='*/' --include='params.json' --include='progress.csv' --include='*test/*.pdf' --include='train/*loss*.pdf' --exclude='*' /z/home/dhiman/mid/floyd-warshall-rl/openai-baselines/her/{d047a03,3a90344}-FetchReach-v1-* ./
rsync -rav --include='*/' --include='params.json' --include='progress.csv' --include='*test/*.pdf' --include='train/*loss*.pdf' --exclude='*' /z/home/dhiman/mid/floyd-warshall-rl/openai-baselines/her/ea0e35b-FetchPush-v1-* ./
rsync -rav --include='*/' --include='params.json' --include='progress.csv' --include='*test/*.pdf' --include='train/*loss*.pdf' --exclude='*' /z/home/dhiman/mid/floyd-warshall-rl/openai-baselines/her/f0d4cfa-FetchReach-v1-* ./
rsync -rav --include='*/' --include='params.json' --include='progress.csv' --include='*test/*.pdf' --include='train/*loss*.pdf' --exclude='*' /z/home/dhiman/mid/floyd-warshall-rl/openai-baselines/her/f84daa7-FetchPush-v1-* ./
rsync -rav --include='*/' --include='params.json' --include='progress.csv' --include='*test/*.pdf' --include='train/*loss*.pdf' --exclude='*' /z/home/dhiman/mid/floyd-warshall-rl/openai-baselines/her/3f1eafe-FetchPush-v1-* ./
# The BIG experiment on all environments
rsync -rav --include='*/' --include='params.json' --include='progress.csv' --include='*test/*.pdf' --include='train/*loss*.pdf' --exclude='*' /z/home/dhiman/mid/floyd-warshall-rl/openai-baselines/her/38f4625-*Fetch*-v1-*future ./
rsync -rav --include='*/' --include='params.json' --include='progress.csv' --include='*test/*.pdf' --include='train/*loss*.pdf' --exclude='*' /z/home/dhiman/mid/floyd-warshall-rl/openai-baselines/her/38f4625-*Hand*-v0-*future ./
# Experiment to compare weighted loss terms (excluded the step term)
rsync -rav --include='*/' --include='params.json' --include='progress.csv' --include='*test/*.pdf' --include='train/*loss*.pdf' --exclude='*' /z/home/dhiman/mid/floyd-warshall-rl/openai-baselines/her/04a8fc6-*-FetchSlide-v1-*future ./
# Experiment to compare effect of path reward
rsync -rav --include='*/' --include='params.json' --include='progress.csv' --include='*test/*.pdf' --include='train/*loss*.pdf' --exclude='*' /z/home/dhiman/mid/floyd-warshall-rl/openai-baselines/her/3d07a6e-FetchReachPR-v1-*-future ./
# Experiemnt to avoid re-computation of rewards for each goal.
rsync -rav --include='*/' --include='params.json' --include='progress.csv' --include='*test/*.pdf' --include='train/*loss*.pdf' --exclude='*' /z/home/dhiman/mid/floyd-warshall-rl/openai-baselines/her/245b3c4-*-FetchReach*-v1-*-future-her_fwrl_path_reward ./
# Effect of middle vs uniformly random sampling for chosing intermediate state
rsync -rav --include='*/' --include='params.json' --include='progress.csv' --include='*test/*.pdf' --include='train/*loss*.pdf' --exclude='*' /z/home/dhiman/mid/floyd-warshall-rl/openai-baselines/her/d249d2d-c9bfa98b-FetchPush-v1-fwrl-future /z/home/dhiman/mid/floyd-warshall-rl/openai-baselines/her/245b3c4-e5f0dd20-FetchPush-v1-fwrl-future- ./
