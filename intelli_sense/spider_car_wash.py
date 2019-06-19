# *-coding:utf-8-*-
import re
from urllib import request
import html
import csv
from urllib.error import HTTPError
import os


class Spider(object):
    # 各部分正则表达式
    model_list_pattern = '<div class="col-md-3">([\s\S]*?)<div class="col-md-9">'
    model_data_pattern = '<div class="panel panel-default ">([\s\S]*?)</div>'
    model_root_pattern = '<a href="([\s\S]*?)" class="list-group-item ">'
    html_root_pattern = '<a href="([\s\S]*?.html)" class="list-group-item'
    html_pattern = '<a href="([a-z_0-9]*?.html)'
    base_file_pattern = '<div class="gb-markdown book-page-inner">([\s\S]*?)<div class="search-results">'
    base_name_file_pattern = '[\s\S]*?(<h2 id[\s\S]*?</h2>)<p>'
    api_name_pattern = '<h2 id="[\s\S]*?">([\s\S]*?)</h2>$'
    real_api_name_pattern = '</h2><h2 id="[\s\S]*?">([\s\S]*?)$'
    table_content_pattern = '<div class="tab-content">([\s\S]*?</div>)'
    tab_panel_pattern = '<div role="tabpanel" class="tab-pane active([\s\S]*?</div>)'
    params_part_file_pattern = '<h[2-5]{1} id="请求地址">([\s\S]*?)<h[2-5]{1} id="返回[\u4e00-\u9fa5]{2}"'
    api_urls_pattern = '</h[2-5]{1}><pre><code>([\s\S]*?)</code></pre>'
    api_params_data_pattern = '[\s\S]*?(</thead><tbody>[\s\S]*?</tbody></table>)[\s\S]*?'
    api_params_pattern = '<td>([\s\S]*?)</td>'
    code_part_file_pattern = '(返回[\u4e00-\u9fa5]{2}</h[2-5]{1}>[\s\S]*?</div>)'
    api_code_data_pattern = '(<h5[\s\S]*?</h5>[<pre>]{0,1}[\s\S]*[</pre>]{0,1})'
    api_code_pattern = 'id="status[^0-9]{1}([0-9]{3})'
    return_pattern = '<a href=[\s\S]*?>([\s\S]*?)</a>*?'
    spider_save_folder = '../cache/document'
    old_save_file = '%s/old_auto_write_robot.csv' % spider_save_folder
    save_file = '%s/auto_write_robot.csv' % spider_save_folder
    old_entity_save_file = '%s/old_auto_write_schema.csv' % spider_save_folder
    entity_save_file = 'auto_write_schema.csv'
    entity_list_pattern = '<div class="col-md-3">([\s\S]*?)<div class="col-md-9">'
    entity_data_pattern = '<div class="panel panel-default ">[\s\S]*?<div class="list-group">([\s\S]*?)</div>'
    entity_root_pattern = '<a href="([\s\S]*?)" class="list-group-item ">'
    entity_name_pattern = '<h2 id="([\s\S]*?)">[\s\S]*?</h2>'
    entity_table_pattern = '(<tbody>[\s\S]*?</tbody>)'
    entity_params_pattern = '<tr><td[\s\S]*?>([\s\S]*?)</td>[\s\S]*?</tr>'
    entity_params_type_pattern = '<tr><td[\s\S]*?<td[\s\S]*?>([\s\S]*?)</td>[\s\S]*?</tr>'

    @classmethod
    def create_folder(cls, folder_path):
        """
        校验是否存在目标路径，不存在则创建路径
        :param folder_path: 目标路径
        :type folder_path: str
        :return: 提示
        :rtype: str
        """
        status = '已存在'
        folder = os.path.exists(folder_path)
        if not folder:
            os.makedirs(folder_path)
            status = '创建成功'
        return '路径：%s 状态：%s' % (folder_path, status)

    @classmethod
    def remove_folder(cls, folder_path):
        """
        校验是否存在目标路径，存在则删除路径
        :param folder_path: 目标路径
        :type folder_path: str
        :return: 提示
        :rtype: str
        """
        folder = os.path.exists(folder_path)
        status = '不存在'
        if folder:
            os.remove(folder_path)
            status = '删除成功'
        return '路径：%s 状态：%s' % (folder_path, status)

    @classmethod
    def rename_folder(cls, folder_path, new_folder_path):
        """
        校验是否存在目标路径，不存在则创建路径
        :param folder_path: 目标路径
        :type folder_path: str
        :param new_folder_path: 新路径
        :type new_folder_path: str
        :return: 提示
        :rtype: str
        """
        folder = os.path.exists(folder_path)
        status = '不存在'
        if folder:
            os.rename(folder_path, new_folder_path)
            status = '删除成功'
        return '路径：%s 状态：%s' % (folder_path, status)

    @staticmethod
    def _get_content(url):
        """
        获取url的网页全文
        :param url: 路径
        :type url:str
        :return: 网页全文
        :rtype: str
        """
        try:
            content = request.urlopen(url).read()
            content = content.decode('utf-8')
            content = html.unescape(content)
            return content
        except HTTPError:
            pass

    def _get_model_url_list(self, content):
        """
        获取模块的url列表
        :param content: 正文
        :type content: str
        :return: 模块的url列表
        :rtype: list
        """
        root_content = re.findall(self.model_list_pattern, content)
        model_content_list = re.findall(self.model_data_pattern, root_content[0])
        model_url_list = re.findall(self.model_root_pattern, model_content_list[1])
        return model_url_list

    def _get_entity_url_list(self, content):
        """
        获取返回实体的url列表
        :param content: 正文
        :type content: str
        :return: 返回实体的url列表
        :rtype: list
        """
        root_content = re.findall(self.entity_list_pattern, content)
        entity_content_list = re.findall(self.entity_data_pattern, root_content[0])
        entity_url_list = re.findall(self.entity_root_pattern, entity_content_list[2])
        return entity_url_list

    def _get_html_url(self, model_url):
        """
        获取下拉菜单中真实的url地址
        :param model_url: 模块url
        :type model_url: str
        :return: 可爬取页面的url
        :rtype: str
        """
        model_content = self._get_content(model_url)
        model_content = re.findall(self.model_data_pattern, model_content)[1]
        html_url = re.findall(self.html_root_pattern, model_content)
        real_url = re.findall(self.html_pattern, html_url[0])[0]
        return real_url

    def _data_inset(self, file_name, content):
        file_name = '%s/%s_url.csv' % (self.spider_save_folder, file_name)
        with open(file_name, 'w+', newline='') as old_api_csv:
            old_api_csv.write('')
        with open(file_name, 'a+', newline='') as api_csv:
            fieldnames = ['接口列表']
            writer = csv.DictWriter(api_csv, fieldnames=fieldnames)
            writer.writeheader()
            index = 0
            for i in content:
                writer.writerow({'接口列表': i})
                index += 1
        print(('写入文件:%s。总计：%s条,成功：%s' % (file_name, len(content), index)))
        print('_______________________________________________________')
        return file_name

    def spider_api(self, service_urls):
        """
        爬取模块信息
        :param service_urls: 文档入口url列表
        :type service_urls: list
        """
        # 如果存在历史文件则移除
        self.remove_folder(self.old_save_file)
        # 如果存在则重命名
        self.rename_folder(self.save_file, self.old_save_file)
        # 打开提供给写入程序的csv文件
        with open(self.save_file, "a+", newline='') as method_csv:
            # 设置表头
            fieldnames = ['服务端', '模块名', '接口名', '请求方式', 'url', '参数名', '参数类型', '是否必传', '响应码情况',
                          '返回实体']
            # 根据表头和表名,创建字典方式写入的表实体
            writer = csv.DictWriter(method_csv, fieldnames=fieldnames)
            # 写入表头
            writer.writeheader()
            # 遍历各服务端的url
            for service_url in service_urls:
                # 初始化实际url的列表
                complete_model_urls = []
                # 获取服务端名称
                service_name = service_url[28:-1]
                print('正在解析:%s' % service_name)
                # 获取服务端的网页全文
                service_content = self._get_content(service_url)
                # 获取模块的url列表
                model_urls = self._get_model_url_list(service_content)
                # 遍历每个模块的url
                for model_url in model_urls:
                    # 获取真实路径尾坠
                    html_url = self._get_html_url('%s%s' % (service_url, model_url))
                    # 拼接真实路径
                    complete_model_url = '%s%s%s' % (service_url, model_url, html_url)
                    # 加入列表
                    complete_model_urls.append(complete_model_url)
                    # 获取模块的全文
                    model_content = self._get_content(complete_model_url)
                    # 解析全文
                    if model_content is None:
                        print('网页不存在：%s' % complete_model_url)
                    else:
                        # 初始化接口名列表
                        api_names = []
                        # 获取关键信息部分
                        base_file = re.findall(self.base_file_pattern, model_content)
                        # 拆分为各接口的信息
                        api_contents = re.findall(self.base_name_file_pattern, base_file[0])
                        # 遍历各接口信息
                        for api_content in api_contents:
                            # 获取接口名
                            api_name = re.findall(self.api_name_pattern, api_content)
                            # 对错误的再次删选，获取精确接口名
                            rel_api_name = re.findall(self.real_api_name_pattern, api_name[0])
                            # 加入接口名列表
                            if len(rel_api_name) != 0:
                                api_names.append(rel_api_name[0])
                            else:
                                api_names.append(api_name[0])
                        # 获取参数部分的table
                        table_content = re.findall(self.table_content_pattern, base_file[0])
                        # 遍历接口名,获取各接口对应的信息
                        for j in range(0, len(api_names)):
                            # 获取模块名
                            model_name = model_url[:-1]
                            # 获取接口名
                            api_name = api_names[j]
                            # 获取最新版本的全文部分
                            new_version_content = re.findall(self.tab_panel_pattern, table_content[j])
                            # 获取接口的请求方式和url
                            api_messages = re.findall(self.api_urls_pattern, new_version_content[0])
                            # 获取请求方式
                            api_method_str = api_messages[0].upper()
                            api_method = re.findall('GET|POST|PUT|PATCH|DELETE', api_method_str)
                            api_method = str(api_method[0])
                            # 获取接口的url
                            api_url = api_messages[0][len(api_method):].replace('\n', '')
                            # 精确获取table中的信息部分
                            part_content = re.findall(self.params_part_file_pattern, new_version_content[0])
                            # 判断是否含有参数部分
                            if part_content:
                                api_params = re.findall(self.api_params_data_pattern, part_content[0])
                            else:
                                api_params = []
                            # 获取参数名,参数类型,是否必传
                            if len(api_params) != 0:
                                api_params = re.findall(self.api_params_pattern, api_params[0])
                                method_name = api_params[::4]
                                method_type = api_params[1::4]
                                method_boolean = api_params[2::4]
                            else:
                                method_name = ''
                                method_type = ''
                                method_boolean = ''
                            # 获取状态码部分全文
                            api_code_content = re.findall(self.code_part_file_pattern, new_version_content[0])
                            # 获取状态码部分精确信息
                            api_codes = re.findall(self.api_code_data_pattern, api_code_content[0])
                            # 获取状态码列表
                            api_code = re.findall(self.api_code_pattern, api_codes[0])
                            if api_code:
                                api_codes_list = api_code
                            else:
                                api_codes_list = []
                            # 获取返回实体部分
                            return_entities = re.findall(self.return_pattern, api_code_content[0])
                            if return_entities:
                                return_entity = return_entities[0]
                            else:
                                return_entity = ''
                            # 写入csv的表数据
                            writer.writerow({'服务端': service_name, '模块名': model_name, '接口名': api_name,
                                             '请求方式': api_method, 'url': api_url, '参数名': method_name,
                                             '参数类型': method_type, '是否必传': method_boolean,
                                             '响应码情况': api_codes_list, '返回实体': return_entity})
                # 记录本次写入的url列表信息
                self._data_inset(service_name, complete_model_urls)

    def spider_entity(self, service_urls):
        """
        爬取返回实体信息
        :param service_urls: 文档入口url列表
        :type service_urls: list
        """
        # 遍历各服务端的url
        for service_url in service_urls:
            # 获取服务端名称
            service_name = service_url[28:-1]
            # 生成各服务端的列表
            sever_list = []
            folder = os.path.exists('%s/server_list.txt' % self.spider_save_folder)
            if folder:
                sever_file = open('%s/server_list.txt' % self.spider_save_folder, "r")
                for i in sever_file:
                    sever_list.append(i.replace('\n', ''))
                sever_file.close()
            sever_file = open('%s/server_list.txt' % self.spider_save_folder, "a+")
            if service_name not in sever_list:
                sever_file.write('%s\n' % service_name)
            # 打开自动生成schema的csv表
            with open('%s/%s_%s' % (self.spider_save_folder, service_name, self.entity_save_file),
                      "w+", newline='') as entity_csv:
                # 表头
                fieldnames = ['服务端', '实体名', '实体参数', '参数类型']
                # 生成一个表实体
                writer = csv.DictWriter(entity_csv, fieldnames=fieldnames)
                # 写入表头
                writer.writeheader()
                # 获取服务端全文
                service_content = self._get_content(service_url)
                # 获取返回实体的url列表
                entity_urls = self._get_entity_url_list(service_content)
                # 遍历返回实体的url
                for entity_url in entity_urls:
                    # 拼接真实的url
                    real_entity_url = '%s%s' % (service_url, entity_url)
                    # 获取返回实体的全文
                    entity_content = self._get_content(real_entity_url)
                    # 解析返回实体
                    if entity_content is None:
                        print('网页不存在：%s' % real_entity_url)
                    else:
                        # 获取关键信息部分
                        base_file = re.findall(self.base_file_pattern, entity_content)
                        # 获取实体名称列表
                        entity_name = re.findall(self.entity_name_pattern, base_file[0])
                        # 获取实体table列表
                        table_content = re.findall(self.entity_table_pattern, base_file[0])
                        # 解析每个实体的信息
                        for i in range(0, len(entity_name)):
                            # 获取参数列表
                            params_list = re.findall(self.entity_params_pattern, table_content[i])
                            # 获取参数类型列表
                            params_type_list = re.findall(self.entity_params_type_pattern, table_content[i])
                            # 写入csv
                            writer.writerow({'服务端': service_name, '实体名': entity_name[i], '实体参数': params_list,
                                             '参数类型': params_type_list})

    def run(self, service_urls):
        # 校验是否存在目标路径，不存在则创建路径
        self.create_folder(self.spider_save_folder)
        # 爬取接口部分信息
        self.spider_api(service_urls)
        # 爬取返回实体部分信息
        self.spider_entity(service_urls)


if __name__ == '__main__':
    # 实例化一个爬虫对象
    spider = Spider()
    # 放入需要爬取的url列表,如果是多端,需要依次写入
    input_url_list = ['http://10.1.50.100/car-wash/admin/', 'http://10.1.50.100/car-wash/app/',
                      'http://10.1.50.100/car-wash/wxmp/']
    # 执行run方法
    spider.run(input_url_list)
