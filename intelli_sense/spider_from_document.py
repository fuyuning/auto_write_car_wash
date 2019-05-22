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

    @staticmethod
    def _get_content(url):
        try:
            content = request.urlopen(url).read()
            content = content.decode('utf-8')
            content = html.unescape(content)
            return content
        except HTTPError:
            pass

    def _get_model_url_list(self, content):
        root_content = re.findall(self.model_list_pattern, content)
        model_content_list = re.findall(self.model_data_pattern, root_content[0])
        model_url_list = re.findall(self.model_root_pattern, model_content_list[1])
        return model_url_list

    def _get_entity_url_list(self, content):
        root_content = re.findall(self.entity_list_pattern, content)
        entity_content_list = re.findall(self.entity_data_pattern, root_content[0])
        entity_url_list = re.findall(self.entity_root_pattern, entity_content_list[2])
        return entity_url_list

    def _get_html_url(self, model_url):
        model_content = self._get_content(model_url)
        model_content = re.findall(self.model_data_pattern, model_content)[1]
        html_url = re.findall(self.html_root_pattern, model_content)
        html_url = re.findall(self.html_pattern, html_url[0])
        return html_url[0]

    def _data_inset(self, file_name, content):
        file_name = '%s/%s_url.csv' % (self.spider_save_folder, file_name)
        with open(file_name, 'w+', newline='') as old_api_csv:
            old_api_csv.write('')
            old_api_csv.close()
        with open(file_name, 'a+', newline='') as api_csv:
            fieldnames = ['接口列表']
            writer = csv.DictWriter(api_csv, fieldnames=fieldnames)
            writer.writeheader()
            index = 0
            for i in content:
                writer.writerow({'接口列表': i})
                index += 1
            api_csv.close()
        print(('写入文件:%s。总计：%s条,成功：%s' % (file_name, len(content), index)))
        print('_______________________________________________________')
        return file_name

    def spider_api(self, service_urls):
        folder = os.path.exists(self.old_save_file)
        if folder:
            os.remove(self.old_save_file)
        folder = os.path.exists(self.save_file)
        if folder:
            os.rename(self.save_file, self.old_save_file)
        with open(self.save_file, "a+", newline='') as method_csv:
            fieldnames = ['服务端', '模块名', '接口名', '请求方式', 'url', '参数名', '参数类型', '是否必传', '响应码情况',
                          '返回实体']
            writer = csv.DictWriter(method_csv, fieldnames=fieldnames)
            writer.writeheader()
            for service_url in service_urls:
                complete_model_urls = []
                index = service_url.rfind('_')
                service_name = service_url[index+1:-1]
                service_content = self._get_content(service_url)
                model_urls = self._get_model_url_list(service_content)
                for model_url in model_urls:
                    html_url = self._get_html_url('%s%s' % (service_url, model_url))
                    complete_model_url = '%s%s%s' % (service_url, model_url, html_url)
                    complete_model_urls.append(complete_model_url)
                    model_content = self._get_content(complete_model_url)
                    if model_content is None:
                        print('网页不存在：%s' % complete_model_url)
                    else:
                        api_names = []
                        base_file = re.findall(self.base_file_pattern, model_content)
                        api_contents = re.findall(self.base_name_file_pattern, base_file[0])
                        for api_content in api_contents:
                            api_name = re.findall(self.api_name_pattern, api_content)
                            rel_api_name = re.findall(self.real_api_name_pattern, api_name[0])
                            if len(rel_api_name) != 0:
                                api_names.append(rel_api_name[0])
                            else:
                                api_names.append(api_name[0])
                        table_content = re.findall(self.table_content_pattern, base_file[0])
                        for j in range(0, len(api_names)):
                            model_name = model_url[:-1]
                            api_name = api_names[j]
                            new_version_content = re.findall(self.tab_panel_pattern, table_content[j])
                            api_urls = re.findall(self.api_urls_pattern, new_version_content[0])
                            api_method = re.findall('GET|POST|PUT|PATCH|DELETE', api_urls[0])
                            api_method = str(api_method[0])
                            api_url = api_urls[0][len(api_method):].replace('\n', '')
                            part_content = re.findall(self.params_part_file_pattern, new_version_content[0])
                            if part_content:
                                api_params = re.findall(self.api_params_data_pattern, part_content[0])
                            else:
                                api_params = []
                            if len(api_params) != 0:
                                api_params = re.findall(self.api_params_pattern, api_params[0])
                                method_name = api_params[::4]
                                method_type = api_params[1::4]
                                method_boolean = api_params[2::4]
                            else:
                                method_name = ''
                                method_type = ''
                                method_boolean = ''
                            api_code_content = re.findall(self.code_part_file_pattern, new_version_content[0])
                            return_entities = re.findall(self.return_pattern, api_code_content[0])
                            api_codes = re.findall(self.api_code_data_pattern, api_code_content[0])
                            api_codes_list = []
                            for i in api_codes:
                                api_code = re.findall(self.api_code_pattern, i)
                                if api_code:
                                    api_codes_list = api_code
                            if return_entities:
                                return_entity = return_entities[0]
                            else:
                                return_entity = ''
                            writer.writerow({'服务端': service_name, '模块名': model_name, '接口名': api_name,
                                             '请求方式': api_method, 'url': api_url, '参数名': method_name,
                                             '参数类型': method_type, '是否必传': method_boolean,
                                             '响应码情况': api_codes_list, '返回实体': return_entity})
                self._data_inset(service_name, complete_model_urls)
        method_csv.close()

    def spider_entity(self, service_urls):
        # folder = os.path.exists(self.old_entity_save_file)
        # if folder:
        #     os.remove(self.old_entity_save_file)
        # folder = os.path.exists(self.entity_save_file)
        # if folder:
        #     os.rename(self.entity_save_file, self.old_entity_save_file)
        index = service_urls[0].rfind('_')
        service_name = service_urls[0][index + 1:-1]
        sever_list = []
        sever_file = open('%s/server_list.txt' % self.spider_save_folder, "r")
        for i in sever_file:
            sever_list.append(i.replace('\n', ''))
        sever_file.close()
        sever_file = open('%s/server_list.txt' % self.spider_save_folder, "a+")
        if service_name not in sever_list:
            sever_file.write('%s\n' % service_name)
        with open('%s/%s_%s' % (self.spider_save_folder, service_name, self.entity_save_file), "w+", newline='') as \
                entity_csv:
            fieldnames = ['服务端', '实体名', '实体参数', '参数类型']
            writer = csv.DictWriter(entity_csv, fieldnames=fieldnames)
            writer.writeheader()
            for service_url in service_urls:
                real_entity_urls = []
                service_content = self._get_content(service_url)
                entity_urls = self._get_entity_url_list(service_content)
                for entity_url in entity_urls:
                    real_entity_url = '%s%s' % (service_url, entity_url)
                    real_entity_urls.append(real_entity_url)
                    entity_content = self._get_content(real_entity_url)
                    if entity_content is None:
                        print('网页不存在：%s' % real_entity_url)
                    else:
                        base_file = re.findall(self.base_file_pattern, entity_content)
                        entity_name = re.findall(self.entity_name_pattern, base_file[0])
                        table_content = re.findall(self.entity_table_pattern, base_file[0])
                        for i in range(0, len(entity_name)):
                            params_list = re.findall(self.entity_params_pattern, table_content[i])
                            params_type_list = re.findall(self.entity_params_type_pattern, table_content[i])
                            writer.writerow({'服务端': service_name, '实体名': entity_name[i], '实体参数': params_list, '参数类型': params_type_list})
        entity_csv.close()

    def run(self, service_urls):
        folder = os.path.exists(self.spider_save_folder)
        if not folder:
            os.makedirs(self.spider_save_folder)
        self.spider_api(service_urls)
        self.spider_entity(service_urls)


if __name__ == '__main__':

    spider = Spider()
    input_url_list = ['http://10.1.50.100/camera_monitor_server/']
    spider.run(input_url_list)
