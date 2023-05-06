import psycopg2 as ps

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
            self.conn.commit()
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