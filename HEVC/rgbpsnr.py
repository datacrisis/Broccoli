import numpy as np
import cv2
import os
import csv
import pandas as pd

path = "/scratch/ar7996/ivp/uvgdataset/"

# Define function to calculate MSE
def mse(img1, img2):
    mse = np.mean((img1 - img2) ** 2)
    if mse == 0:
        return float('inf')
    return mse

# Load images
images1 = []
images2 = []
qps = ["17", "22", "27", "32", "37", "42"]

# Create an empty DataFrame
df = pd.DataFrame({'Video' : [], 'Resolution' : [], 'QP' : [], 'PSNR': [], "BPP": []})

# Write the DataFrame to a new CSV file
df.to_csv('data.csv', index=False)

for drc in os.listdir(path):
    if os.path.isdir(os.path.join(path, drc)):
        newpath = os.path.join(path, drc)
        if "_8bit_" in newpath:
            for drc2 in os.listdir(newpath):
                if os.path.isdir(os.path.join(newpath, drc2)):
                    newpath2 = os.path.join(newpath, drc2)
                    if "cropped_images" in newpath2:
                        tokenized = drc2.split('_')
                        t_len = len(tokenized)
                        if t_len == 9:
                            if tokenized[6] == "3840x2160" or tokenized[6] == "2560x1440":
                                continue
                        else:
                            if tokenized[4] == "3840x2160" or tokenized[4] == "2560x1440":
                                continue
                        del images1
                        images1 = []
                        for filename in os.listdir(newpath2):
                            img = cv2.imread(os.path.join(newpath2,filename)).astype(np.float32)
                            if img is not None:
                                images1.append(img)
                        newpath3 = newpath2[:-14]
                        print(newpath3)
                        for qp in qps:
                            images2 = []
                            newpath4 = newpath3 + "hevc_video_x265_qp_" + qp + "_inter"
                            for filename in os.listdir(newpath4):
                                img = cv2.imread(os.path.join(newpath4,filename)).astype(np.float32)
                                if img is not None:
                                    images2.append(img)
                            
                            # Calculate average PSNR
                            num_images = len(images1)
                            mses = []
                            total_psnr = 0
                            for img1, img2 in zip(images1, images2):
                                mse_ = mse(img1, img2)
                                mses.append(mse_)

                            mses = np.array(mses)
                            video_mse = np.mean(mses)
                            psnr = 10 * np.log10(255**2 / video_mse)

                            if t_len == 9:
                                video_h = int(tokenized[6].split('x')[0])
                                video_w = int(tokenized[6].split('x')[1])
                            else:
                                video_h = int(tokenized[4].split('x')[0])
                                video_w = int(tokenized[4].split('x')[1])
                                
                            
                            video_path = newpath3 + "hevc_video_x265_qp_" + qp + "_inter.265"
                            total_bits = os.path.getsize(video_path) * 8
                            bpp = total_bits/(video_h*video_w*num_images)
                            
                            del images2
                            
                            if t_len == 9:
                                data = pd.DataFrame({'Video' : [str(tokenized[0])], 'Resolution' : [str(tokenized[6])], 'QP' : [str(qp)], 'PSNR': [str(psnr)], "BPP": [str(bpp)]})
                            else:
                                data = pd.DataFrame({'Video' : [str(tokenized[0])], 'Resolution' : [str(tokenized[4])], 'QP' : [str(qp)], 'PSNR': [str(psnr)], "BPP": [str(bpp)]})
                                
                            
                            df = pd.read_csv('data.csv')
                            # Concatenate the two DataFrames vertically
                            updated_df = pd.concat([df, data], ignore_index=True)

                            # Write the updated DataFrame to the CSV file
                            updated_df.to_csv('data.csv', index=False)
                            
                            # data = pd.DataFrame({'Video' : tokenized[0], 'Resolution' : tokenized[4], 'QP' : qp, 'PSNR': psnr, "BPP": bpp})

