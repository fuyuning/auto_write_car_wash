# *-coding:utf-8-*-
import re
import os


# 自动生成robot文件类
class AutoWriteParams(object):
    @staticmethod
    def _auto_write():
        file = open('../cache/params/params_list.txt', "r")
        params_list = []
        for line in file:
            if line not in params_list:
                params_list.append(line)
        params_robot = open('../tests/resources/params.robot', "w+")
        params_robot.write('*** Variables ***\n')
        for i in params_list:
            params_robot.write(i)
        params_robot.close()

    # run方法
    def run(self):
        self._auto_write()


if __name__ == '__main__':
    auto_write_params = AutoWriteParams()
    auto_write_params.run()
