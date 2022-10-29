from flask import Flask, request, jsonify, make_response
import pickle
import json
import pandas as pd
import numpy as np


model=pickle.load(open('tmaskhir.pkl','rb'))

app = Flask(__name__)


@app.route('/estimate', methods=['POST'])
def predict():
    data = request.get_json();
    brand= data["brands"]
    cpu_brand = data["cpu_brand"]
    cpu_model = data["cpu_model"]
    cpu_generation = data["cpu_generation"]
    cpu_line = data["cpu_line"]
    cpu_family = data["cpu_family"]
    gpu = data["gpu"]
    gpu_type = data["gpu_type"]
    gpu_model = data["gpu_model"]
    gpu_vram = data["gpu_vram"]
    ram = data["ram"]
    ram_type = data["ram_type"]
    screen_size = data["screen_size"]
    screen_resolution = data["screen_resolution"]
    screen_refreshrate = data["screen_refreshrate"]
    anti_reflect = data["anti_reflect"]
    tactil = data["tactil"]
    hdd = data["hdd"]
    ssd = data["ssd"]
    state = data["state"]

    data= {
        "brand": [data["brands"]],
        "cpu_brand" :[ data["cpu_brand"]],
        "cpu_model" : [data["cpu_model"]],
        "cpu_generation" : [data["cpu_generation"]],
        "cpu_line" : [data["cpu_line"]],
        "cpu_family" : [data["cpu_family"]],
        "gpu" : [data["gpu"]],
        "gpu_type" : [data["gpu_type"]],
        "gpu_model" : [data["gpu_model"]],
        "gpu_vram" : [data["gpu_vram"]],
        "ram" : [data["ram"]],
        "ram_type" : [data["ram_type"]],
        "screen_size" : [data["screen_size"]],
        "screen_resolution" : [data["screen_resolution"]],
        "screen_refreshrate" : [data["screen_refreshrate"]],    
        "anti_reflect" : [data["anti_reflect"]],
        "tactil" : [data["tactil"]],
        "hdd" : [data["hdd"]],
        "ssd" : [data["ssd"]],
        "state" : [data["state"]]
    }

    data = pd.DataFrame(data)
    data["brand"]=data["brand"].astype("str")
    data["cpu_brand"]=data["cpu_brand"].astype("str")
    data["cpu_model"]=data["cpu_model"].astype("str")
    data["cpu_family"]=data["cpu_family"].astype("str")
    data["gpu"]=data["gpu"].astype("str")
    data["gpu_type"]=data["gpu_type"].astype("str")
    data["gpu_model"]=data["gpu_model"].astype("str")
    data["ram_type"]=data["ram_type"].astype("str")
    data["screen_resolution"]=data["screen_resolution"].astype("str")
    data["anti_reflect"]=data["anti_reflect"].astype("str")
    data["tactil"]=data["tactil"].astype("str")
    data["state"]=data["state"].astype("str")

    estimation = model.predict(data)
    return jsonify({'The predicted price is':str(estimation)})


@app.route('/assistant', methods=['POST'])
def handleWebhook():
    req = request.get_json();
    res = webhook(req)
    r = make_response(res)
    r.headers['Content-Type'] = 'application/json'
    return r


def webhook(req):
    transform = request.get_json();
    parameters = req.get("parameters")
    brand=parameters.get("brands")
    cpu_brand = parameters.get("cpu_brand")
    cpu_model=parameters.get("cpu_model")
    cpu_generation=parameters.get("cpu_generation")
    cpu_line=parameters.get("cpu_line")
    cpu_family=parameters.get("family")
    gpu=parameters.get("gpu")
    gpu_type=parameters.get("gpu_type")
    gpu_model=parameters.get("gpu_model")
    gpu_vram=parameters.get("gpu_vram")
    ram=parameters.get("ram")
    ram_type=parameters.get("ram_type")
    screen_size=parameters.get("screen_size")
    screen_resolution=parameters.get("screen_resolution")
    screen_refreshrate=parameters.get("screen_refreshrate")
    anti_reflect=parameters.get("anti_reflect")
    tactil=parameters.get("tactil")
    hdd=parameters.get("hdd")
    ssd=parameters.get("ssd")
    state=parameters.get("state")

    features = [brand,cpu_brand,cpu_model,cpu_generation,cpu_line,cpu_family,gpu,gpu_type,gpu_model,gpu_vram,ram,ram_type,screen_size,
                   screen_resolution,screen_refreshrate,anti_reflect,tactil,hdd,ssd,state]
    transform= {
        "brand": [transform["brands"]],
        "cpu_brand" :[ transform["cpu_brand"]],
        "cpu_model" : [transform["cpu_model"]],
        "cpu_generation" : [transform["cpu_generation"]],
        "cpu_line" : [transform["cpu_line"]],
        "cpu_family" : [transform["cpu_family"]],
        "gpu" : [transform["gpu"]],
        "gpu_type" : [transform["gpu_type"]],
        "gpu_model" : [transform["gpu_model"]],
        "gpu_vram" : [transform["gpu_vram"]],
        "ram" : [transform["ram"]],
        "ram_type" : [transform["ram_type"]],
        "screen_size" : [transform["screen_size"]],
        "screen_resolution" : [transform["screen_resolution"]],
        "screen_refreshrate" : [transform["screen_refreshrate"]],    
        "anti_reflect" : [transform["anti_reflect"]],
        "tactil" : [transform["tactil"]],
        "hdd" : [transform["hdd"]],
        "ssd" : [transform["ssd"]],
        "state" : [transform["state"]]
    }

    transform = pd.DataFrame(transform)
    transform["brand"]=transform["brand"].astype("str")
    transform["cpu_brand"]=transform["cpu_brand"].astype("str")
    transform["cpu_model"]=transform["cpu_model"].astype("str")
    transform["cpu_family"]=transform["cpu_family"].astype("str")
    transform["gpu"]=transform["gpu"].astype("str")
    transform["gpu_type"]=transform["gpu_type"].astype("str")
    transform["gpu_model"]=transform["gpu_model"].astype("str")
    transform["ram_type"]=transform["ram_type"].astype("str")
    transform["screen_resolution"]=transform["screen_resolution"].astype("str")
    transform["anti_reflect"]=transform["anti_reflect"].astype("str")
    transform["tactil"]=transform["tactil"].astype("str")
    transform["state"]=transform["state"].astype("str")
    intent = req["queryResult"]["intent"]["displayName"]

    if intent == "predictor":
        prediction = model.predict(transform)

    fulfillmenText= "The price laptop seems to be..  {} !".format(prediction)
    # You can also use the google.cloud.dialogflowcx_v3.types.WebhookRequest protos instead of manually writing the json object
    res = {"fulfillmentMessages": [{"text": {"text": [prediction]}}]}

    return res

if __name__ == '__main__':
    app.run(debug=True)

