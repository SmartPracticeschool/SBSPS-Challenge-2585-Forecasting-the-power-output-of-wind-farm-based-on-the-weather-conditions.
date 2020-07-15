# !flask/bin/python
from flask import Flask, jsonify,request,json
import os


app = Flask( __name__, static_url_path='' )

port = int( os.getenv( 'PORT', 8000 ) )


@app.route('/getdata', methods=['GET'])
def get_tasks():
  with open('./data/Preds.json') as f:
    preds = json.load(f)
  preds = preds[0]
  return jsonify(preds)

@app.route('/data', methods=['GET'])
def get_query_string():  
  fileName =  request.args.get('file')
  with open('./data/'+ fileName +'.json') as f:
    myData = json.load(f)
  myData = myData[0]
  return jsonify(myData)
    

if __name__ == '__main__':
    app.run( host='0.0.0.0', port=port, debug=True)
