
import os
import shutil
import asyncio


async def process_item(site,name):
    print("开始打包 : " + site)
    cmd = "flutter build apk --flavor " + name + " --dart-define=CHANNEL=" + name
    print(cmd)
#     system = os.system(cmd)
#     print(system)
     # 创建子进程执行命令
    process = await asyncio.create_subprocess_shell(
        cmd,
        stdout=asyncio.subprocess.PIPE,
        stderr=asyncio.subprocess.PIPE
    )

    stdout, stderr = await process.communicate()  # 等待命令完成

    if stdout:
        print(f"[{cmd}] stdout: {stdout.decode().strip()}")  # 输出标准输出
    if stderr:
        print(f"[{cmd}] stderr: {stderr.decode().strip()}")  # 输出错误输出


async def startCmd():
    key_value = {"9000": "dw","9003": "boya", "9005": "fuyuan", "9006": "shouxin", "9007": "aomen",
                 "9008": "gdvip","9009": "leyou", "9010": "jsgj", "9011": "longmen",
                 "9012": "jbp", "9013": "yygj", "9015": "zxgj"}


#     list = ["9000", "9003", "9005", "9006", "9007", "9008", "9009", "9010", "9011", "9012", "9013", "9015"]
    list = ["9000","9003"]


    # 创建一个包含所有异步任务的列表
    tasks = [process_item(site,key_value[site]) for site in list]
    # 使用 asyncio.gather 并行执行所有任务
    await asyncio.gather(*tasks)

    # for key in key_value.keys():
asyncio.run(startCmd())



