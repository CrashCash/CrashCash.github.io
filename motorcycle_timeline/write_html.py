import sqlite3
from bs4 import BeautifulSoup

# pragma foreign_keys = on;
# create table items (id integer primary key, year integer not null, item text not null);
# create table citations (id integer primary key, item integer not null, cite text, link text, inline text, foreign key (item) references items (id));
conn=sqlite3.connect('motorcycle_timeline.db')
cursor=conn.cursor()

year_old=0

print('<html>')
print('<head>')
print('<title>Motorcycle Timeline</title>')
print('<style>')
print('.home { position: fixed; top: 10px; right: 10px; }')
print('.year { font-weight: bold; font-size: 150%; padding-left: 15px; }')
print('a {text-decoration: none; }')
print('ul { padding-top: 0px; padding-bottom: 10px; margin: 0px; list-style-type: disc; padding-left: 15px;')
print('padding-right: 40px; }')
print('li { margin-top: 2px; margin-bottom: 2px; }')
print('</style>')
print('<base target="_blank">')
print('</head>')
print('<body>')
print('<a target="_self" href="https://crashcash.github.io/" class="home">Home</a>')
print('<center><h1>Motorcycle Timeline</h1></center>')
print('<center><h3>A chronological summary of important motorcycles, people, races, and events.</h3></center>')

cursor.execute('SELECT id, year, item FROM items ORDER BY year, id')
rows=cursor.fetchall()
for id, year, item in rows:
   if year != year_old:
      if year_old > 0:
         print('</ul>')
      if year // 10 != year_old // 10:
         print('<hr>')
      print('<div class="year">%d</div>' % year)
      print('<ul>')
      year_old=year

   # convert non-ASCII character shit to entities
   item=BeautifulSoup(item, 'html.parser').prettify(formatter="html").strip()

   # get citation links
   cursor.execute('SELECT inline, link FROM citations WHERE item = ?', [id])
   citations=cursor.fetchall()
   ctr=1
   for inline, link in citations:
      if link:
         item+='\n<a href="'+link+'">[%d]</a>' % ctr
      if inline:
         item+=' ('+inline+')'

   print('<li>'+item+'</li>')

print('</ul>')
print('<hr>')
print('<br>')

print('References:<br>')
cursor.execute('SELECT DISTINCT cite FROM citations ORDER BY 1')
citations=cursor.fetchall()
for cite in citations:
   if cite[0]:
      print(cite[0]+'<br>')

print('<br>')
print('Copyright &copy; 2017-2025 Charles E. Cash. All rights reserved.')
print('</body>')
print('</html>')
