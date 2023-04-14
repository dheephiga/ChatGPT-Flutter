from flask import Flask, request, jsonify
import openai

app = Flask(__name__)


@app.route('/api',methods = ['GET'])

def prompt():
    openai.organization = "ENTER YOUR ORG ID"
    api_key = "ENTER YOUR API KEY"
    openai.api_key = api_key
    d = {}
    get_prompt = str(request.args['query'])
    completion = openai.ChatCompletion.create(
    model="gpt-3.5-turbo",
    messages=[
    {"role": "user", "content": str(get_prompt)}
    ]
    )
    d['output'] = completion.choices[0].message.content
    return d


if __name__ == "__main__":
    app.run()
