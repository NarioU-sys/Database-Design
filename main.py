from faker import Faker
import random
import psycopg2
from datetime import datetime
import os


fake = Faker() ### initializing faker objects for

user = os.getenv('POSTGRES_USER')
password = os.getenv('POSTGRES_PASSWORD')
host = os.getenv('POSTGRES_HOST')
port = os.getenv('PORT')
name = os.getenv('POSTGRES_DB')

conn = psycopg2.connect(
    database = name,
    user = user,
    password= password,
    port = port,
    host = host
    
)

# print("Database is successfully connected")
cursor = conn.cursor()

###### Generating data for customer
def gen_customers(num_customer):
    customer = []
    for _ in range(num_customer):
        global customer_id
        customer_id= fake.uuid4()
        username = fake.user_name()
        email = fake.free_email()
        password = fake.password()
        first_name = fake.first_name()
        last_name = fake.last_name()
        phone_number = fake.phone_number()
        address = fake.address().replace('\n', ' ')
        city = fake.city()
        state = fake.state()
        zip_code = fake.zipcode()
        country = fake.country()
        
        customer.append(customer_id, username,email,password, first_name, last_name, phone_number, address, city,
                        state, zip_code, country)
    yield customer
#### INSERTION OF DATA
def ins_customer(customer):
    insert_query= """
    INSERT INTO customer(customer_id, username, email, password, first_name, last_name, phone_number,)
    address, city, state, zip_code, country)
    VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);
    """
    cursor.executemany(insert_query, customer)
    conn.commit()
        
def gen_books(num_books,author):
    books= []
    for _ in range(num_books):
        global book_id
        book_id = fake.sbn9()
        book_title = fake.sentences(nb=15, ext_word_list=['abcd', 'efgh', 'ijkl', 'mnop', 'qrst', 'uvwxyz'])
        author = fake.name()
        publication_date = fake.date_object()
        language = fake.language_name()
        copies = random.randint(1,21)
        
        books.append(book_id, book_title, author, publication_date, language, copies)
    yield books
    
#### INSERTION OF DATA
def ins_books(books):
    insert_query= """
    INSERT INTO books(book_id, book_title, author, publication_date, language, copies)
    VALUES(%s, %s, %s, %s, %s, %s);
    """
    cursor.executemany(insert_query, books)
    conn.commit()
        
        
        
def gen_date( month):
    date = []
    global date_id
    for _ in range(date_id):
        date_id = fake.datetime.time()
        dates = fake.date()
        day = fake.day_of_week()
        month = fake.month_name()
        week_of_month = fake.day_of_month()
        year = fake.year()
        
        date.append(date_id ,dates, day, month, week_of_month, year)
    yield date
    
#### INSERTION OF DATA 
def ins_date(date):
    insert_query= """
    INSERT INTO date(date_id, dates, day, month, week_of_month, year)
    VALUES(%s, %s, %s, %s, %s, %s);
    """
    cursor.executemany(insert_query, date)
    conn.commit()     
        
def gen_interaction():
    global interaction_id
    interaction = []
    for _ in range():
        interaction_id = fake.bothify(text='CUST_INT-######??')
        customer_id = fake.uuid4()
        reg_id = fake.ssn()
        interaction_type = fake.word(ext_word_list=["Social_media", "Email", "Phone", "Text"])
        interaction_rating = fake.word(ext_word_list=["Fair", "Good", "Excellent", "Bad", "Worse"])
        
        interaction.append(interaction_id, customer_id, reg_id, interaction_type, interaction_rating)
    yield interaction
        
#### INSERTION OF DATA
def ins_interaction(interaction):
    insert_query= """
    INSERT INTO interaction(interaction_id, customer_id, reg_id, interaction_type, interaction_rating)
    VALUES(%s, %s, %s, %s, %s);
    """
    cursor.executemany(insert_query, interaction)
    conn.commit()      

def gen_library(num_libary):
    global library_id
    library=[]
    for _ in range(num_libary):
        library_id = fake.uuid4()
        library_reg_id = fake.company_business_id()
        library_name = fake.large_company()
        
        library.append(library_id, library_reg_id, library_name)
    yield library
    
#### INSERTION OF DATA
def ins_library(library):
    insert_query= """
    INSERT INTO library(library_id, library_reg_id, library_name)
    VALUES(%s, %s, %s);
    """
    cursor.executemany(insert_query, library)
    conn.commit()
        
        
        
def gen_loan():
    global loan_id
    loan=[]
    for _ in range():
        loan_id = fake.bothify(text='CUST_LOAN-######??')
        customer_id = fake.uuid4()
        shelf_id = random.randint(1,50)
        loan_date = fake.date_time()
        return_date = fake.date_time()
        statu = fake.boolean(chance_of_getting_true=25)
        
        loan.append(loan_id ,customer_id, shelf_id, loan_date, return_date, statu)
    yield loan
    
#### INSERTION OF DATA
def ins_loan(loan):
    insert_query= """
    INSERT INTO loan(loan_id, customer_id, shelf_id, loan_date, return_date, statu)
    VALUES(%s, %s, %s, %s, %s, %s);
    """
    cursor.executemany(insert_query, loan)
    conn.commit()


def gen_location():
    location =[]
    global location_id
    for _ in range():
        location_id = fake.local_latlng()
        addresses = fake.address()
        city = fake.city_with_postcode()
        states = fake.state_name()
        country = fake.country()
        
        location.append(location_id, addresses, city, states, country, )
    yield location
        
#### INSERTION OF DATA
def ins_location(location):
    insert_query= """
    INSERT INTO location(location_id, addresses, city, states, country)
    VALUES(%s, %s, %s, %s, %s);
    """
    cursor.executemany(insert_query, location)
    conn.commit()
      
def gen_purchase():
    purchase = []
    global purchase_id
    for _ in range():
        purchase_id = fake.bothify(text='CUST_PUR-######??')
        book_id = fake.sbn9()
        customer_id= fake.uuid4()
        amount=fake.random_int(min=2000, max=35000)
        method = fake.word(ext_word_list=['Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer', 'Cash'])
        statu = fake.word(ext_word_list=["Pending", "Completed", "Failed"])
        date = datetime.timestamp()
        
        purchase.append(purchase_id, book_id, customer_id, amount, method, statu, date)
    yield purchase
    
#### INSERTION OF DATA
def ins_purchase(purchase):
    insert_query= """
    INSERT INTO purchase(purchase_id, book_id, customer_id,amount, method, statu, date)
    VALUES(%s, %s, %s, %s, %s, %s);
    """
    cursor.executemany(insert_query, purchase)
    conn.commit()
        
        
def gen_reg():
    reg=[]
    global reg_id
    for _ in range(reg_id):
        reg_id= fake.ssn()
        customer_id = fake.uuid4()
        reg_date = datetime.timestamp()
        account_type = fake.word(ext_word_list=['Online', 'Onsite', 'Foreign', 'Personal', 'Commercial'])
        username = fake.user_name()
        pass_word = fake.password()
        
        reg.append(reg_id, customer_id, reg_date, account_type, username, pass_word)
    yield reg

#### INSERTION OF DATA
def ins_reg(reg):
    insert_query= """
    INSERT INTO reg(reg_id, customer_id, reg_date, account_type, username, password)
    VALUES(%s, %s, %s, %s, %s);
    """
    cursor.executemany(insert_query, reg)
    conn.commit()
            
            
def gen_shelf(collection):
    global shelf_id
    shel =[]
    for _ in range(collection): 
        shelf_id = random.randint(1,50)
        book_id = fake.sbn9()
        collection = fake.word(ext_word_list=["Books&Ebooks", "Databases", "Digital_Collection", "Humanity", "E-Journal", "Digital_Common", "Special_collection"])
        genre = fake.word(ext_word_list=["Fiction", "Non-Fiction", "Fantasy", "Memoir & Autobiography", "History",
         "Health", "Science", "Technology"])
        shel.append(shelf_id, book_id, collection, genre)
    yield shel
 
#### INSERTION OF DATA
def ins_shelf(shel):
    insert_query= """
    INSERT INTO shel(shelf_id, book_id, collection, genre)
    VALUES(%s, %s, %s, %s, %s);
    """
    cursor.executemany(insert_query, shel)
    conn.commit()   
    
def gen_admin(admin_id):
    admin = []
    for _ in range(admin_id):
        admin_id = fake.ssn()
        is_admin = fake.boolean(chance_of_getting_true=100)
        statu = fake.word(ext_word_list=["CHECKED", "NOT_CHECKED"])
        created_at = fake.time()
        update_at = fake.time()
        admin.append(admin_id, customer_id, reg_id, date_id, location_id, loan_id, purchase_id,
        interaction_id, library_id, is_admin, statu, created_at, update_at)
    return admin
    
def ins_admin(admin):
    query = """
    INSERT INTO admin(admin_id, customer_id, reg_id, date_id, location_id, loan_id, purchase_id, 
    interaction_id, library_id, is_admin, statu, created_at, update_at)
    VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
    """
    cursor.execute(query, admin)
    conn.commit()
    
def gen_collections(coll_id):
    coll= []
    for _ in range(coll_id):
        coll_id = random.randint(100, 200)
        coll.append(coll_id, shelf_id, book_id)
    return coll

def ins_coll(coll):
    query= """"
    INSERT INTO coll(coll_id, shelf_id, book_id)
    VALUES(%s, %s, %s)
    """
    cursor.execute(query, coll)
    conn.commit()
    #conn.close()

############## COMBINATION ##############

