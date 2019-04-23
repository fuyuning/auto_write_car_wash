# *-coding:utf-8-*-
import re
import os


# 自动生成robot文件类
class AutoWriteRobot1(object):
    # 解析爬取的数据
    def _parse_file(self, file_name):
        file = open(file_name, 'r')
        index2 = 0
        flag = ''
        lib_name = ''
        model_list = []
        txt = open('../cache/log/document_wrong.txt', "w+")
        for line in file:
            line = line.replace(' ', '')
            data = line.split('||')
            data[5] = data[5][1:-1].replace('\'', '').split(',')
            data[6] = data[6][1:-1].replace('\'', '').split(',')
            data[7] = data[7][1:-1].replace('\'', '').split(',')
            data[8] = data[8][1:-1].replace('\'', '').split(',')
            service_name = data[0]
            model_name = data[1]
            api_name = data[2]
            api_method = data[3]
            api_url = data[4]
            api_params_name_list = data[5]
            api_params_type_list = data[6]
            api_params_nn_list = data[7]
            api_codes_list = data[8]
            if api_url.find(':') != -1 and str(api_codes_list).find('404') == -1:
                api_codes_list.append('404')
                txt.write(service_name+'_'+model_name+':'+api_name+'：缺少 404,加入后:'+str(api_codes_list)+'\r')
            if api_params_name_list[0] != '' and str(api_codes_list).find('422') == -1:
                api_codes_list.append('422')
                txt.write(service_name+'_'+model_name+':'+api_name+'：缺少 422,加入后:'+str(api_codes_list)+'\r')
            if len(re.findall('404', str(api_codes_list))) > 1:
                index = []
                for i in api_codes_list:
                    if i not in index:
                        index.append(i)
                api_codes_list = index
                txt.write(service_name+'_'+model_name + ':' + api_name + '：含有过多 404,移除后:' + str(api_codes_list)+'\r')
            api_list = []
            if flag != service_name+'_'+model_name:
                flag = service_name + '_' + model_name
                model_list = []
                lib_name = self._write_robot_file_settings(service_name, model_name)
                self._write_library_head(lib_name, model_name)
            api_list.append(service_name)
            api_list.append(model_name)
            api_list.append(api_name)
            api_list.append(api_method)
            api_list.append(api_url)
            api_list.append(api_params_name_list)
            api_list.append(api_codes_list)
            api_list.append(lib_name)
            api_list.append(api_params_nn_list)
            api_list.append(api_params_type_list)
            model_list.append(api_list)
            index2 += 1
            if index2 == 4:
                break
        self.parse_model_file(model_list)
        txt.close()

    # 解析模块文件
    def parse_model_file(self, model):
        print(len(model))
        case_switch = True
        keyword_switch = True
        for i in range(0, 3):
            for api in model:
                service_name = api[0]
                model_name = api[1]
                api_name = api[2]
                api_method = api[3]
                api_url = api[4]
                api_params_name_list = api[5]
                api_codes_list = api[6]
                lib_name = api[7]
                if i == 0:
                    self._write_lib_file(lib_name, model_name, api_method, api_url, api_params_name_list)
                if i == 1:
                    self._write_robot_file_case(service_name, model_name, api_name, api_method, api_url,
                                                api_params_name_list, api_codes_list, case_switch)
                    case_switch = False
                if i == 2:
                    self._write_robot_file_keywords(service_name, model_name, api_method, api_url, api_codes_list,
                                                    keyword_switch)
                    keyword_switch = False

    def _write_library_head(self, lib_name, model_name):
        lib_name = '../'+lib_name.replace('.', '/')
        lib = os.path.exists(lib_name)
        if not lib:
            os.makedirs(lib_name)
        class_name = self._upper_name(model_name)
        lib_file = open(lib_name + '/' + class_name + 'Library.py', 'w+')
        lib_file.write('from robot_car_wash.robot_car_wash_server_library.common import CommonLibrary\r\r\r')
        lib_file.write('class ' + class_name + 'Library(CommonLibrary):\r')

    # 根据爬取的数据生成library
    def _write_lib_file(self, lib_name, model_name, api_method, api_url, api_params_name_list):
        api_method = self._upper_name(api_method)
        class_name = self._upper_name(model_name)
        lib_name = lib_name.replace('.', '/')
        lib_file = open('../'+lib_name + '/' + class_name + 'Library.py', 'a+')
        url_parts = api_url.split(":")
        url_part_one = url_parts[0]
        if len(url_parts) > 1:
            id_name = url_parts[1]
            url_params = ', '+id_name
        else:
            id_name = ''
            url_params = ''

        format_data = ''
        if id_name != '':
            format_data = ', '+id_name+'='+id_name
            id_in_name = '{'+id_name+'}'
        else:
            id_in_name = ''
        change_data = ''
        api_method = api_method.lower()
        if api_method == 'get':
            change_data = 'params=data'
        elif api_method in ('post', 'put', 'patch'):
            change_data = 'json=data'
        if len(api_params_name_list) > 1:
            change_data = ', '+change_data
        else:
            change_data = ''
        api_params = ''
        for i in api_params_name_list:
            api_params = api_params + '"' + i + '", '

        if api_params == '"", ':
            kwargs_name = ''
        else:
            kwargs_name = ', **kwargs'
        method_name = (api_method + '_' + model_name + '_by_' + id_name).lower()
        lib_file.write('    def ' + method_name + '(self' + url_params + kwargs_name+'):\r')
        lib_file.write('        url = "{SERVER_DOMAIN}'+url_part_one+id_in_name
                       + '".format(\r            SERVER_DOMAIN=self.SERVER_DOMAIN'+format_data+')\r')
        if api_params != '"", ':
            lib_file.write('        data = {}\r'
                           + '        for k, v in kwargs.items():\r'
                           + '            if k in ('+api_params+'):\r'
                           + '                data[k] = v\r')
        lib_file.write('        return self.client.'+api_method+'(url'+change_data+')\r\r')

    # 根据爬取的数据生成robot文件头
    def _write_robot_file_settings(self, service_name, model_name):
        full_name = service_name+'_'+model_name
        folder = os.path.exists('../tests/'+full_name)
        if not folder:
            os.makedirs('../tests/'+full_name)
        robot = open('../tests/'+full_name+'/'+model_name+'.robot', 'w+')
        robot.write('*** Settings ***\r')
        robot.write('Documentation  '+full_name+'\r')
        robot.write('Resource  ../resources.robot'+'\r')
        lib_name = ''
        setup = ''
        teardown = ''
        name_tag = ''
        if service_name == 'admin':
            lib_name = 'robot_car_wash_server_library.'
            setup = 'Suite Setup  Login  ${admin_username}   ${admin_password}'
            teardown = 'Suite Teardown  Logout'
            name_tag = '虾洗后台'
        elif service_name == 'app':
            lib_name = 'robot_car_wash_app_library.'
            setup = 'Suite Setup  Login  ${app_username}  ${app_password}'
            teardown = ''
            name_tag = '虾客APP'
        elif service_name == 'wxmp':
            lib_name = 'robot_car_wash_wxmp_library.'
            setup = 'Suite Setup  Login By Openid  ${openid}'
            teardown = ''
            name_tag = '车主微信端'
        lib_name = lib_name[:-1]+'.'+model_name
        class_name = self._upper_name(model_name)
        robot.write('Library  '+lib_name+'.'+class_name+'Library'+'\r')
        robot.write(setup+'\r')
        robot.write(teardown+'\r')
        robot.write('Force Tags  model:'+full_name+'  '+name_tag+'\r\r\r')
        return lib_name

    # 根据爬取的数据生成robot文件keywords
    def _write_robot_file_keywords(self, service_name, model_name, api_method, api_url, api_codes_list, keyword_switch):
        full_name = service_name+'_'+model_name
        api_method = self._upper_name(api_method)
        robot = open('../tests/'+full_name+'/'+model_name+'.robot', 'a+')
        for api_code in api_codes_list:
            url_parts = api_url.split(":")
            if len(url_parts) > 1:
                id_name = url_parts[1].replace('_', ' ')
                js_name = api_method + ' By Id '
            else:
                id_name = ''
                js_name = api_method + ' '
            if api_code == '200':
                kw_name = js_name + 'Success ' + api_code
                json_name = full_name+'/'+js_name+api_code+'.json\r\r'
            elif api_code == '201':
                kw_name = js_name + 'Success ' + api_code
                json_name = full_name+'/'+js_name+api_code+'.json\r\r'
            elif api_code == '204':
                kw_name = js_name + 'Success ' + api_code
                json_name = '\r\r'
            elif api_code == '404':
                kw_name = js_name + 'Fail ' + api_code
                json_name = '\r\r'
            elif api_code == '403':
                kw_name = js_name + 'Fail ' + api_code
                json_name = '\r\r'
            elif api_code == '422':
                kw_name = js_name + 'Fail ' + api_code
                json_name = full_name+'/'+js_name+api_code+'.json\r\r'
            else:
                kw_name = ''
                json_name = '\r\r'
            json_name = json_name.replace(' ', '_')
            method_name = (api_method + ' ' + model_name + ' by ' + id_name).lower()
            if keyword_switch is True:
                robot.write('*** Keywords ***\r')
                keyword_switch = False
            robot.write(kw_name+'\r')
            robot.write('   [Arguments]  &{kwargs}\r')
            robot.write('   ${resp}=  '+method_name+'  &{kwargs}\r')
            robot.write('   expect status is '+api_code+'  ${resp}  '+json_name)

    # 根据爬取的数据生成robot文件test_case
    def _write_robot_file_case(self, service_name, model_name, api_name, api_method, api_url, api_params_name_list,
                               api_codes_list, case_switch):
        full_name = service_name+'_'+model_name
        api_method = self._upper_name(api_method)
        robot = open('../tests/'+full_name+'/'+model_name+'.robot', 'a+')
        model_name = self._upper_name(model_name).replace('_', ' ')
        for api_code in api_codes_list:
            if api_url.find(':') == -1:
                st_name = api_method+' '
                js_name = api_method+' '+model_name+' '
                flag = False
            else:
                st_name = api_method+' By Id '
                js_name = api_method+' '+model_name+' By Id '
                flag = True
            if api_code == '200':
                kw_name = st_name + 'Success ' + api_code
                tc_name = js_name + 'Success '
            elif api_code == '201':
                kw_name = st_name + 'Success ' + api_code
                tc_name = js_name + 'Success '
            elif api_code == '204':
                kw_name = st_name + 'Success ' + api_code
                tc_name = js_name + 'Success '
            elif api_code == '404':
                kw_name = st_name + 'Fail ' + api_code
                tc_name = js_name + 'Fail With Wrong Url'
            elif api_code == '403':
                kw_name = st_name + 'Fail ' + api_code
                tc_name = js_name + 'Fail Without Login'
            elif api_code == '422':
                kw_name = st_name + 'Fail ' + api_code
                tc_name = js_name + 'Fail With Wrong Params'
            else:
                kw_name = ''
                tc_name = ''
            if case_switch is True:
                robot.write('*** Test Cases ***\r')
                case_switch = False
            robot.write(tc_name+'\r')
            robot.write('   [Documentation]  接口名:' + api_name + '${\\n}\r   ...              请求方式:' + api_method +
                        '${\\n}\r   ...              预期结果:\r')
            robot.write('   [Tags]           Respcode:'+api_code+'\r')
            if flag is False and api_params_name_list != []:
                robot.write('   ${essential_params}  create list  \r')
                robot.write('   ${unessential_params}  create list  \r')
                robot.write('   run every case by params  '+kw_name+'  ${essential_params}  ${unessential_params}\r\r')
            if flag is False and api_params_name_list == []:
                robot.write('    '+kw_name+'r\r')
            if flag is True and api_params_name_list != []:
                robot.write('   ${essential_params}  create list  \r')
                robot.write('   ${unessential_params}  create list  \r')
                robot.write('   run every case by params  '+kw_name+'  ${essential_params}  ${unessential_params}  '+
                            api_url.split(':')[1]+'=\r\r')
            if flag is True and api_params_name_list == []:
                robot.write('   '+kw_name+'  '+api_url.split(':')[1]+'=\r\r')

    @staticmethod
    def _upper_name(name):
        str_list = name.split('_')
        for index in range(0, len(str_list)):
            if str_list[index] != '':
                str_list[index] = str_list[index][0].upper() + str_list[index][1:].lower()
            else:
                continue
        return ''.join(str_list)

    # run方法
    def run(self):
        self._parse_file('../cache/document/auto_write_robot.txt')
        # self._write_robot_file()


if __name__ == '__main__':
    auto_write_robot1 = AutoWriteRobot1()
    auto_write_robot1.run()
