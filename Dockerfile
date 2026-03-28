# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# The workflow's custom nodes are listed under unknown_registry with no aux_id provided,
# so they could not be resolved to a registry package or a GitHub repo. Skipping installation.
# Could not resolve unknown_registry node CheckpointLoaderSimple - no aux_id provided; skipping
# Could not resolve unknown_registry node ControlNetApplyAdvanced - no aux_id provided; skipping
# Could not resolve unknown_registry node FloatConstant - no aux_id provided; skipping
# Could not resolve unknown_registry node FloatConstant - no aux_id provided; skipping
# Could not resolve unknown_registry node LatentOperationSharpen - no aux_id provided; skipping
# Could not resolve unknown_registry node LatentApplyOperationCFG - no aux_id provided; skipping
# Could not resolve unknown_registry node LatentApplyOperation - no aux_id provided; skipping

# download models into comfyui
RUN comfy model download --url https://huggingface.co/rocket0123/model/blob/main/cetusMix_Whalefall2.safetensors --relative-path models/checkpoints --filename cetusMix_Whalefall2.safetensors
RUN comfy model download --url https://huggingface.co/monster-labs/control_v1p_sd15_qrcode_monster/blob/main/control_v1p_sd15_qrcode_monster.safetensors --relative-path models/controlnet --filename control_v1p_sd15_qrcode_monster.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
