
import os
import shutil
import subprocess


def startCmd():
    key_value = {"9000": "dw","9003": "boya", "9005": "fuyuan", "9006": "shouxin", "9007": "aomen",
                 "9008": "gdvip","9009": "leyou", "9010": "jsgj", "9011": "longmen",
                 "9012": "jbp", "9013": "yygj", "9015": "zxgj"}


    list = ["9000", "9003", "9005", "9006", "9007", "9008", "9009", "9010", "9011", "9012", "9013", "9015"]
#     list = ["9000"]


    for site in list:
        print("开始打包 : " + site)
#         flutter build apk --flavor dw --dart-define=CHANNEL=dw
#         print("将key 从 : " + os.getcwd()+"/"+"app/key/"+site+"/"+"fob.jks" +"    复制到  "+ os.getcwd()+"/"+"fob.jks")
#         shutil.copyfile(os.getcwd()+"/"+"app/key/"+site+"/"+"fob.jks", os.getcwd()+"/"+"fob.jks")
#       system = os.system("gradlew " + "clean" )
        cmd = "flutter build apk --flavor " + key_value[site] + " --dart-define=CHANNEL=" + key_value[site]
        print(cmd)
        system = os.system(cmd)
        print(system)

    # for key in key_value.keys():
startCmd()
