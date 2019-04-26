# *-coding:utf-8-*-

import os


class AutoClean(object):
    @staticmethod
    def clean_dir_in_list(dir_name_list):
        for dir_name in dir_name_list:
            folder = os.path.exists(dir_name)
            if folder:
                if os.path.isdir(dir_name):
                    file_names = os.listdir(dir_name)
                    for file_name in file_names:
                        os.remove(dir_name+'/'+file_name)
                        print(dir_name+'/'+file_name+'删除成功')
                    os.removedirs(dir_name)
                else:
                    os.remove(dir_name)
                print(dir_name+'删除成功')

    # run方法
    def run(self, dir_name_list):
        self.clean_dir_in_list(dir_name_list)


if __name__ == '__main__':
    auto_clean = AutoClean()
    dir_list = [
        '../robot_car_wash_app_library/oauth2',
        '../robot_car_wash_wxmp_library/login',
        '../tests/app_oauth2',
        '../tests/wxmp_login/logins.unauthorized.robot',
        '../tests/wxmp_login/logins.robot',
    ]
    auto_clean.run(dir_list)
