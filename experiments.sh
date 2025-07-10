
python -m mineral.scripts.run \
task=Rewarped agent=RewarpedAnymalPPO task.env.env_name=Anymal \
task.env.no_grad=True \
\
logdir="workdir/RewarpedAnymal10M-PPO/$(date +%Y%m%d-%H%M%S.%2N)" \
agent.ppo.max_agent_steps=10e6 \
\
num_envs=64 env_render=True headless=False task.env.render=True agent.render=True \
\
wandb.mode=online wandb.project=rewarped-quadruped \
run=train_eval seed=100

#agent.network.actor_critic_kwargs.mlp_kwargs.units=\[128,64,32\] \
#+agent.network.actor_critic_kwargs.critic_mlp_kwargs.units=\[64,64\] \
#\


# Define the seeds_rewarped you want to run for
#seeds_rewarped=(1000 2000 3000 4000 5000)
#seeds_dflex=(100 200 300 400 500)


# 1. Experiment: SAPO rewarped on Ant env
# for seed in "${seeds_rewarped[@]}"; do
#   echo "Running SAPO rewarped with seed: ${seed}"
#   python -m mineral.scripts.run \
#     task=Rewarped agent=DFlexAntSAPO task.env.env_name=Ant task.env.env_suite=dflex \
#     logdir="workdir/RewarpedAnt4M-SAPO/$(date +%Y%m%d-%H%M%S.%2N)" \
#     agent.shac.max_epochs=2000 agent.shac.max_agent_steps=4.1e6 \
#     agent.network.actor_kwargs.mlp_kwargs.units=\[128,64,32\] \
#     agent.network.critic_kwargs.mlp_kwargs.units=\[64,64\] \
#     wandb.mode=online wandb.project=rewarped-sol wandb.group=SAPO-Ant-rewarped \
#     run=train_eval seed=${seed}
# done

# # 2. Experiment: SHAC rewarped on Ant env
# for seed in "${seeds_rewarped[@]}"; do
#   echo "Running SHAC rewarped with seed: ${seed}"
#   python -m mineral.scripts.run \
#     task=Rewarped agent=DFlexAntSHAC task.env.env_name=Ant task.env.env_suite=dflex \
#     logdir="workdir/RewarpedAnt4M-SHAC/$(date +%Y%m%d-%H%M%S.%2N)" \
#     agent.shac.max_epochs=2000 agent.shac.max_agent_steps=4.1e6 \
#     agent.network.actor_kwargs.mlp_kwargs.units=\[128,64,32\] \
#     agent.network.critic_kwargs.mlp_kwargs.units=\[64,64\] \
#     wandb.mode=online wandb.project=rewarped-sol wandb.group=SHAC-Ant-rewarped \
#     run=train_eval seed=${seed}
# done

## 3. Experiment: SHAC dflex
#for seed in "${seeds_dflex[@]}"; do
#  echo "Running SHAC dflex with seed: ${seed}"
#  python -m mineral.scripts.run \
#    task=DFlex agent=DFlexAntSHAC task.env.env_name=ant \
#    logdir="workdir/DFlexAnt10M-SHAC/$(date +%Y%m%d-%H%M%S.%2N)" \
#    agent.shac.max_epochs=5000 agent.shac.max_agent_steps=10e6 \
#    agent.network.actor_kwargs.mlp_kwargs.units=\[128,64,32\] \
#    agent.network.critic_kwargs.mlp_kwargs.units=\[64,64\] \
#    wandb.mode=online wandb.project=rewarped-sol wandb.group=SHAC-Ant-dflex \
#    run=train_eval seed=${seed}
#done