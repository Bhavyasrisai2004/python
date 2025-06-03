import mysql.connector

class Database:
    def __init__(self):
        pass
    def connect(self):
        self.con = mysql.connector.connect(
            host = "localhost",
            user="root",
            password="root",
            database = "ATM"
        )
        self.cur = self.con.cursor()
    
    def insert(self,name,account_no,password,pin,balance):
        self.connect()
        self.cur.execute("insert into detail values(%s,%s,%s,%s,%s)",(account_no,name,password,pin,balance))
        self.con.commit()
        self.cur.close()
        self.con.close()
        print("data added successfully....")
    def delete(self):
        pass

    def display(self):
        self.connect()
        self.cur.execute("select * from detail")
        data = self.cur.fetchall()
        for row in data:
            print(row)
        self.con.commit()
        self.cur.close()
        self.con.close()


