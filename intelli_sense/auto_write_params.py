# *-coding:utf-8-*-
import os


# 自动生成robot文件类
class AutoWriteParams(object):
    @staticmethod
    def _auto_write():
        file = open('../cache/params/params_list.txt', "r")
        params_list = []
        for line in file:
            name = line.split(',')[0]
            print(name)
            types = line.split(',')[1].replace('\n', '')
            print(types)
            if name.endswith('422}'):
                if types == 'string':
                    value = 'ThisIsRobot  ThisIsRobot  ThisIsRobot'
                elif types == 'int':
                    value = 'ThisIsRobot'
                elif types == 'json':
                    value = 'ThisIsRobot'
                elif types == 'array':
                    value = 'ThisIsRobot'
                elif types == 'float':
                    value = 'ThisIsRobot'
                elif types == 'integer':
                    value = 'ThisIsRobot'
                elif types == 'object':
                    value = 'ThisIsRobot'
                else:
                    value = ''
            else:
                value = ''
            name = name+'  '+value
            print(name)
            if name not in params_list:
                params_list.append(name)
        folder = os.path.exists('../tests/resources/params.robot')
        if folder:
            os.rename('../tests/resources/params.robot', '../tests/resources/old_params.robot')
        params_robot = open('../tests/resources/params.robot', "w+")
        params_robot.write('*** Variables ***\n')
        for i in params_list:
            params_robot.write(i+'\n')
        params_robot.close()

    # run方法
    def run(self):
        self._auto_write()


if __name__ == '__main__':
    auto_write_params = AutoWriteParams()
    auto_write_params.run()
