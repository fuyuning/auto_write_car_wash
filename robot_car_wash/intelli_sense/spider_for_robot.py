# *-coding:utf-8-*-
import re
from urllib import request
import html
# 爬虫类
from urllib.error import HTTPError

import os


class Spider(object):
    # 各部分正则表达式
    index_url = 'http://10.1.50.100/car-wash/'
    index_pattern = '<pre><a href="../">../</a>([\s\S]*?)</pre>'
    service_root_pattern = '<a href="([\s\S]*?)">'
    model_list_pattern = '<div class="col-md-3">([\s\S]*?)<div class="col-md-9">'
    model_data_pattern = '<div class="panel panel-default ">([\s\S]*?)</div>'
    model_root_pattern = '<a href="([\s\S]*?)"[\s\S]*?">'
    base_file_pattern = '<div class="gb-markdown book-page-inner">([\s\S]*?)<div class="search-results">'
    base_name_file_parttern = '[\s\S]*?(<h2 id[\s\S]*?</h2>)<p>'
    api_name_pattern = '<h2 id="[\s\S]*?">([\s\S]*?)</h2>$'
    real_api_name_pattern = '</h2><h2 id="[\s\S]*?">([\s\S]*?)$'

    table_content_pattern = '<div class="tab-content">([\s\S]*?</div>)'
    tabpanel_pattern = '<div role="tabpanel" class="tab-pane active([\s\S]*?</div>)'

    params_part_file_parttern = '<h[2-5]{1} id="请求地址">([\s\S]*?)<h[2-5]{1} id="返回结果"'
    api_urls_pattern = '</h[2-5]{1}><pre><code>([\s\S]*?)</code></pre>'
    api_params_data_pattern = '[\s\S]*?(</thead><tbody>[\s\S]*?</tbody></table>)[\s\S]*?'
    api_params_pattern = '<td>([\s\S]*?)</td>'
    code_part_file_parttern = '(返回结果</h4>[\s\S]*?</div>)'
    api_code_data_pattern = '(<h5[\s\S]*?</h5>)'
    api_code_pattern = 'id="status[^0-9]{1}([0-9]{3})[\s\S]*?"'

    # 通过url获取内容
    @staticmethod
    # 获取网页信息
    def _get_content(url):
        try:
            content = request.urlopen(url).read()
            content = content.decode('utf-8')
            content = html.unescape(content)
            return content
        except HTTPError:
            pass

    # 获取初始网页
    def _get_index_content(self):
        index_content = Spider._get_content(self.index_url)
        return index_content

    # 获取各模块的url列表
    def _get_service_url_list(self, content):
        service_url_list = []
        root_content = re.findall(self.index_pattern, content)
        service_content_list = re.findall(self.service_root_pattern, root_content[0])
        for service_part_url in service_content_list:
            service_url = self.index_url + service_part_url
            service_url_list.append(service_url)
        return service_url_list

    # 获取模块里的接口url列表
    def _get_model_url_list(self, content):
        model_url_list = []
        root_content = re.findall(self.model_list_pattern, content)
        model_content_list = re.findall(self.model_data_pattern, root_content[0])
        model_content_list = re.findall(self.model_root_pattern, model_content_list[1])
        for model_part_url in model_content_list:
            model_url_list.append(model_part_url)
        return model_url_list

    # 用文件缓存读取内容
    @ staticmethod
    def _data_inset(file_name, content):
        file_name = '../cache/document/'+file_name+".txt"
        txt = open(file_name, "w+")
        txt.write('')
        txt = open(file_name, "a+")
        index = 0
        for i in content:
            try:
                txt.write(i)
                txt.write("\r")
                index += 1
            finally:
                pass
        txt.close()
        print('写入文件:'+file_name+'。总计：' + str(len(content)) + '条,成功：' + str(index))
        return file_name

    # run方法
    def run(self):
        folder = os.path.exists('../cache/document')
        if not folder:
            os.makedirs('../cache/document')
        # 初始化缓存文档
        txt = open('../cache/document/auto_write_robot.txt', "w+")
        txt.write('')
        # 获取初始网页
        index_content = self._get_index_content()
        # 获取各服务端的完整url列表
        service_urls = self._get_service_url_list(index_content)
        print(service_urls)
        # 循环获取每个服务端的url
        for service_url in service_urls:
            # 模块完整url列表
            complete_model_urls = []
            # 获取每个服务端的名字
            service_name = service_url[28:-1]
            # 获取各模块的网页
            service_content = self._get_content(service_url)
            # 获取各模块的模块名url列表
            model_urls = self._get_model_url_list(service_content)
            for model_url in model_urls:
                # 生成完整url并装入列表
                complete_model_url = service_url + model_url + model_url[0:-1] + '.html'
                complete_model_urls.append(complete_model_url)
                # 获取当前模块网页
                model_content = self._get_content(complete_model_url)
                # 如果网页不存在输出网页url
                if model_content is None:
                    print('网页不存在：'+complete_model_url)
                else:
                    api_names = []
                    # 开始追加写缓存文件
                    txt = open('../cache/document/auto_write_robot.txt', "a+")
                    # 获取网页关键信息部分
                    base_file = re.findall(self.base_file_pattern, model_content)
                    # 获取标题h2部分
                    api_contents = re.findall(self.base_name_file_parttern, base_file[0])
                    # 获取各接口名
                    for api_content in api_contents:
                        api_name = re.findall(self.api_name_pattern, api_content)
                        rel_api_name = re.findall(self.real_api_name_pattern, api_name[0])
                        if len(rel_api_name) != 0:
                            api_names.append(rel_api_name[0])
                        else:
                            api_names.append(api_name[0])

                    table_content = re.findall(self.table_content_pattern, base_file[0])
                    # 根据名字下标写入
                    for j in range(0, len(api_names)):
                        # 写入服务端名字
                        txt.write(service_name + '  ||  ')
                        # 写入模块名
                        txt.write(model_url[:-1] + '  ||  ')
                        # 生成接口名
                        api_name = api_names[j]
                        # 写入接口名
                        txt.write(str(api_name)+'  ||  ')
                        # 获取最新版本部分
                        new_version_content = re.findall(self.tabpanel_pattern, table_content[j])
                        # 获取请求方式和接口url
                        api_urls = re.findall(self.api_urls_pattern, new_version_content[0])
                        api_method = re.findall('GET|POST|PUT|PATCH|DELETE', api_urls[0])
                        api_method = str(api_method[0])
                        api_url = api_urls[0][len(api_method):].replace('\n', '')
                        # 写入请求方式和接口url
                        txt.write(api_method+'  ||  '+api_url+'  ||  ')
                        # 获取参数部分
                        part_content = re.findall(self.params_part_file_parttern, new_version_content[0])
                        api_params = re.findall(self.api_params_data_pattern, part_content[0])
                        # 获取参数列表
                        if len(api_params) != 0:
                            # 获取参数信息(名，类型，是否必传，备注)
                            api_params = re.findall(self.api_params_pattern, api_params[0])
                            txt.write(str(api_params[::4]) + '  ||  ')
                            txt.write(str(api_params[1::4]) + '  ||  ')
                            txt.write(str(api_params[2::4]) + '  ||  ')
                        else:
                            txt.write('  ||  ')
                            txt.write('  ||  ')
                            txt.write('  ||  ')
                        # 获取所有响应码情况
                        api_code_content = re.findall(self.code_part_file_parttern, new_version_content[0])
                        api_codes = re.findall(self.api_code_data_pattern, api_code_content[0])
                        api_codes_list = []
                        for i in api_codes:
                            api_code = re.findall(self.api_code_pattern, i)
                            if api_code:
                                api_codes_list.append(api_code[0])
                        # 写入状态码
                        txt.write(str(api_codes_list)+'  ||  ')
                        txt.write('\r')

            # 生成各模块完整url缓存文件
            self._data_inset(service_name, complete_model_urls)
            print('_______________________________________________________')
        # 关闭文件操作
        txt.close()
        # self._write_robot_file()


if __name__ == '__main__':

    spider = Spider()
    spider.run()
