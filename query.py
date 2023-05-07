import psycopg2 as ps
import os
import shutil

class query_helper:
    conn=ps.connect(host="localhost",dbname="postgres",user="postgres",port="1234",password="molek12118")
    conn.autocommit = True
    cur=conn.cursor()      
    def __init__(self):
        self.cur.execute("SELECT 1 FROM pg_catalog.pg_database WHERE datname = 'ecommerce'")
        exists = self.cur.fetchone()
        if not exists:
            self.cur.execute("CREATE DATABASE ecommerce")
            self.conn.commit()
            self.cur.close()
            self.conn.close()
            self.conn=ps.connect(host="localhost",dbname="ecommerce",user="postgres",port="1234",password="molek12118")
            self.conn.autocommit = True
            self.cur=self.conn.cursor() 
            self.cur.execute(open("queries/create_tables.sql", "r", encoding="utf8").read())
            self.cur.execute(open("queries/admin_sukru.sql", "r", encoding="utf8").read())
            self.cur.execute(open("queries/example_data.sql", "r", encoding="utf8").read())
            self.conn.commit()
            if os.path.exists("static/images/dbimages/"):#when db first created delete all the dirs except example
                for path, directories, files in os.walk("static/images/dbimages/"):
                    for dir in directories:
                        if(dir!="example"):
                            shutil.rmtree("static/images/dbimages/"+dir)
                    break
        else:
            self.cur.close()
            self.conn.close()
            self.conn=ps.connect(host="localhost",dbname="ecommerce",user="postgres",port="1234",password="molek12118")
            self.conn.autocommit = True
            self.cur=self.conn.cursor() 
    def __del__(self):
        self.cur.close()
        self.conn.close()
    def query(self, q_str: str):
        i=0
        while i<5:#try to reconnect 5 time, if the connection between database and app is dropped
            i+=1
            try:
                self.cur.execute(q_str)
                self.conn.commit()
            except ps.OperationalError:
                self.cur.close()
                self.conn.close()
                self.conn=ps.connect(host="localhost",dbname="ecommerce",user="postgres",port="1234",password="molek12118")
                self.conn.autocommit = True
                self.cur=self.conn.cursor() 
                continue
            break
        try:
            return self.cur.fetchall()
        except:
            return None