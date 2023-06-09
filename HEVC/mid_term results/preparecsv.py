import csv

with open('hevc_yuv_2.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    field = ["Video", "Codec", "Resolution", "Bitrate", "QP", "BPP", "PSNR", "Inter", "Intra"]
    
    writer.writerow(field)

    writer.writerow(["Beauty", "H.265", "960x480", "10292.3", "17", "0.18613100405092592", "26.127227", "1", "0"])
    writer.writerow(["Beauty", "H.265", "960x480", "2376.3", "22", "0.04297417534722222", "26.162582", "1", "0"])
    writer.writerow(["Beauty", "H.265", "960x480", "879.2", "27", "0.01589988425925926", "26.184710", "1", "0"])
    writer.writerow(["Beauty", "H.265", "960x480", "429.0", "32", "0.007758246527777778", "26.217240", "1", "0"])
    writer.writerow(["Beauty", "H.265", "960x480", "232.5", "37", "0.004204644097222222", "26.260083", "1", "0"])
    writer.writerow(["Beauty", "H.265", "960x480", "139.0", "42", "0.002513744212962963", "26.293585", "1", "0"])
    writer.writerow(["Beauty", "H.265", "960x480", "103565.2", "17", "1.872923900462963", "26.092099", "0", "1"])
    writer.writerow(["Beauty", "H.265", "960x480", "43607.5", "22", "0.7886194299768519", "26.123136", "0", "1"])
    writer.writerow(["Beauty", "H.265", "960x480", "16262.2", "27", "0.2940936053240741", "26.156214", "0", "1"])
    writer.writerow(["Beauty", "H.265", "960x480", "8914.4", "32", "0.16121238425925927", "26.175756", "0", "1"])
    writer.writerow(["Beauty", "H.265", "960x480", "5760.0", "37", "0.10416666666666667", "26.193330", "0", "1"])
    writer.writerow(["Beauty", "H.265", "960x480", "4104.3", "42", "0.07422417534722223", "26.193543", "0", "1"])

    writer.writerow(["Bosphorus", "H.265", "960x480", "10292.3", "17", "0.18613100405092592", "26.127227", "1", "0"])
    writer.writerow(["Bosphorus", "H.265", "960x480", "2376.3", "22", "0.04297417534722222", "26.162582", "1", "0"])
    writer.writerow(["Bosphorus", "H.265", "960x480", "879.2", "27", "0.01589988425925926", "26.184710", "1", "0"])
    writer.writerow(["Bosphorus", "H.265", "960x480", "429.0", "32", "0.007758246527777778", "26.217240", "1", "0"])
    writer.writerow(["Bosphorus", "H.265", "960x480", "232.5", "37", "0.004204644097222222", "26.260083", "1", "0"])
    writer.writerow(["Bosphorus", "H.265", "960x480", "139.0", "42", "0.002513744212962963", "26.293585", "1", "0"])
    writer.writerow(["Bosphorus", "H.265", "960x480", "103565.2", "17", "1.872923900462963", "26.092099", "0", "1"])
    writer.writerow(["Bosphorus", "H.265", "960x480", "43607.5", "22", "0.7886194299768519", "26.123136", "0", "1"])
    writer.writerow(["Bosphorus", "H.265", "960x480", "16262.2", "27", "0.2940936053240741", "26.156214", "0", "1"])
    writer.writerow(["Bosphorus", "H.265", "960x480", "8914.4", "32", "0.16121238425925927", "26.175756", "0", "1"])
    writer.writerow(["Bosphorus", "H.265", "960x480", "5760.0", "37", "0.10416666666666667", "26.193330", "0", "1"])
    writer.writerow(["Bosphorus", "H.265", "960x480", "4104.3", "42", "0.07422417534722223", "26.193543", "0", "1"])

    writer.writerow(["HoneyBee", "H.265", "960x480", "10292.3", "17", "0.18613100405092592", "26.127227", "1", "0"])
    writer.writerow(["HoneyBee", "H.265", "960x480", "2376.3", "22", "0.04297417534722222", "26.162582", "1", "0"])
    writer.writerow(["HoneyBee", "H.265", "960x480", "879.2", "27", "0.01589988425925926", "26.184710", "1", "0"])
    writer.writerow(["HoneyBee", "H.265", "960x480", "429.0", "32", "0.007758246527777778", "26.217240", "1", "0"])
    writer.writerow(["HoneyBee", "H.265", "960x480", "232.5", "37", "0.004204644097222222", "26.260083", "1", "0"])
    writer.writerow(["HoneyBee", "H.265", "960x480", "139.0", "42", "0.002513744212962963", "26.293585", "1", "0"])
    writer.writerow(["HoneyBee", "H.265", "960x480", "103565.2", "17", "1.872923900462963", "26.092099", "0", "1"])
    writer.writerow(["HoneyBee", "H.265", "960x480", "43607.5", "22", "0.7886194299768519", "26.123136", "0", "1"])
    writer.writerow(["HoneyBee", "H.265", "960x480", "16262.2", "27", "0.2940936053240741", "26.156214", "0", "1"])
    writer.writerow(["HoneyBee", "H.265", "960x480", "8914.4", "32", "0.16121238425925927", "26.175756", "0", "1"])
    writer.writerow(["HoneyBee", "H.265", "960x480", "5760.0", "37", "0.10416666666666667", "26.193330", "0", "1"])
    writer.writerow(["HoneyBee", "H.265", "960x480", "4104.3", "42", "0.07422417534722223", "26.193543", "0", "1"])