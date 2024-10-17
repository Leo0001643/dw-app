
import os
import shutil


def startCmd():
    key_value = {"9000": "dw","9003": "boya", "9005": "fuyuan", "9006": "shouxin", "9007": "aomen",
                 "9008": "gdvip","9009": "leyou", "9010": "jsgj", "9011": "longmen",
                 "9012": "jbp", "9013": "yygj", "9015": "zxgj"}


#     list = ["9000", "9003", "9005", "9006", "9007", "9008", "9009", "9010", "9011", "9012", "9013", "9015"]
    list = ["9000", "9005"]


    for site in list:
#         print("清理缓存 : " + site)
#         system = os.system("flutter clean")
#         print("请求依赖 : " + site)
#         system = os.system("flutter pub get")
        print("开始打包 : " + site)
        cmd = "flutter build apk --flavor " + key_value[site] + " --dart-define=CHANNEL=" + key_value[site]
#         cmd = "flutter build ipa --flavor " + key_value[site] + " --dart-define=CHANNEL=" + key_value[site]
        print(cmd)
        system = os.system(cmd)
        print(system)

    # for key in key_value.keys():
startCmd()




