from skimage.measure import compare_ssim

import glob

pred_loc = '/home/jeyamariajose/Projects/Self_Attention_Aux_Synthesis/checkpoints/brainus-base/web/images/*_real_image.jpg'
GT_loc = '/home/jeyamariajose/Projects/Self_Attention_Aux_Synthesis/checkpoints/brainus-base/web/*_synthesized_image.jpg'

for filename in glob.iglob(pred_loc):
	print(filename[99 :])
