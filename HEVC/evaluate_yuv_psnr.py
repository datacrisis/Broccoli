import numpy as np
import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--gt', type=str, required=True)
parser.add_argument('--rc', type=str, required=True)
parser.add_argument('--width', type=int, required=True)
parser.add_argument('--height', type=int, required=True)
parser.add_argument('--num_frames', type=int, required=True)

args = parser.parse_args()

frame_offset = args.height * args.width * 3 // 2
gt_yuv = np.memmap(
    args.gt, dtype=np.uint8, mode='r', shape=(args.num_frames, frame_offset))
rc_yuv = np.memmap(
    args.rc, dtype=np.uint8, mode='r', shape=(args.num_frames, frame_offset))
mses = []
for i in range(args.num_frames):
    gt_y_frame = gt_yuv[i, :args.height * args.width].astype(np.float32)
    gt_u_frame = gt_yuv[i, args.height * args.width:args.height * args.width * 5 // 4].astype(np.float32)
    gt_v_frame = gt_yuv[i, args.height * args.width * 5 // 4:].astype(np.float32)
    rc_y_frame = rc_yuv[i, :args.height * args.width].astype(np.float32)
    rc_u_frame = rc_yuv[i, args.height * args.width:args.height * args.width * 5 // 4].astype(np.float32)
    rc_v_frame = rc_yuv[i, args.height * args.width * 5 // 4:].astype(np.float32)
    mse_y = np.mean((gt_y_frame - rc_y_frame)**2)
    mse_u = np.mean((gt_u_frame - rc_u_frame)**2)
    mse_v = np.mean((gt_v_frame - rc_v_frame)**2)
    mses.append([mse_y, mse_u, mse_v])
mses = np.array(mses)
video_mse = np.mean(mses, axis=0)
psnr_y = 10 * np.log10(255**2 / video_mse[0])
psnr_u = 10 * np.log10(255**2 / video_mse[1])
psnr_v = 10 * np.log10(255**2 / video_mse[2])
# print((video_mse[0] + (video_mse[1] + video_mse[2]) / 2) / 255 / 255 * 4)
print(f'Y MSE: {video_mse[0] / 255 / 255 * 4:.6f}')
uv_mse = (video_mse[1] + video_mse[2]) / 2
print(f'UV MSE: {uv_mse / 255 / 255 * 4:.6f}')
# print(f'PSNR Y: {psnr_y:.2f}, PSNR U: {psnr_u:.2f}, PSNR V: {psnr_v:.2f}')
print(f'{psnr_y:.2f},{psnr_u:.2f},{psnr_v:.2f}')