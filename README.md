# Mobile Fast Style Transfer for iOS

Create your own styles styled images directly on your mobile device. It allows the users to take any photograph and turn it into a an image looking like a painting.
The app is written in swift and leverages python code for with tensorflow and keras to train models. It was developed with a focus on portability and tha ability to run the models without access to the cloud.


## User Guide

To transform a picture, follow these steps:
- Click on the camera icon to access your image selection
- Choose either camera or library for the input
- Once the image is loaded, click `TRANSFORM` to run the style transfer model
- Click `SAVE` to save the resulting image to your photo library

<div align='center'>
<img src =Images/Screen%20Shot%202019-04-23%20at%209.17.37%20AM.png height="200px">
</div>

## Results

Here are a few examples of the models I have trained and that are available in the git repository for the app
<div align='center'>
<img src =Images/Screen%20Shot%202019-04-23%20at%209.17.37%20AM.png height="200px"></a>
<br>
  <img src =Images/Screen%20Shot%202019-04-23%20at%209.26.30%20AM.png height="200px">
  <img src =Images/Screen%20Shot%202019-04-23%20at%209.26.41%20AM.png height="200px">
  <img src =Images/Screen%20Shot%202019-04-23%20at%209.29.17%20AM.png height="200px">
  <img src =Images/Screen%20Shot%202019-04-23%20at%209.31.24%20AM.png height="200px">
  <img src =Images/Screen%20Shot%202019-04-23%20at%209.41.55%20AM.png height="200px">
</div>

# Installation

## Compiling

- This can be compiled for or run in the simulator
- You may need to update the bundle identifier and team in the app's general tab to allow it to run on your device


## Compatibility

- This app was built to run on any iOS device running iOS 12 or higher
- It has only been tested on an iPhone Xs.
- Next revisions will include a broader range of iOS and devices

## Dependencies

This app uses CocoaPods and the Fritz SDK. The full references of those are listed in
- Fritz Quickstart guide
>[https://docs.fritz.ai/quickstart.html](https://docs.fritz.ai/quickstart.html)
- Cocoa Pods
>[https://cocoapods.org/](https://cocoapods.org/)

# Using different style transfer models

## Using other included models

To use other models included, you need to replace the `CustomStyleModel.mlmodel`  in XCode:
- In Xcode, delete the file `CustomStyleModel.mlmodel`
- From the folder `style_transfer / models / other models` copy another model file to the folder `style_transfer / models / other models`
- Rename the file you just copied `CustomStyleModel.mlmodel`
- Move the file back to Xcode, setting the target
- Rebuild the app in Xcode and Voilà!

## Training your own models

- Guide to training new models for Fritz SDK

>[https://heartbeat.fritz.ai/20-minute-masterpiece-4b6043fdfff5](https://heartbeat.fritz.ai/20-minute-masterpiece-4b6043fdfff5)

# List of improvements for next releases

- Redesigning buttons and giving feedbacks to the clicks
- Combing both live video recording and photo transform options
- Allowing multiple style choices
- Include an easy share button
- Allow style sharing between apps to give your friends the styles you created
- Leveraging CoreML2 flexible images for model inputs and outputs
>[https://developer.apple.com/machine-learning/](https://developer.apple.com/machine-learning/)
- Implementation on Android using Tensorflow Lite
>[https://www.tensorflow.org/lite](https://www.tensorflow.org/lite)

# Credits / license

- A special thanks to **Michael Ramos** for the inspiration in his original work on style transfer, and the **Fritz team** for building a great and easy to use product
- This app is under the MIT License
- The Fritz pod present in this app is under the Apache License

# References


- My initial work on style transfer looked at a slow style transfer implementation from **Andrew Ng’s Deep Learning Specialization classes on Coursera**, using VGG19 CNN:
>[https://www.coursera.org/learn/convolutional-neural-networks](https://www.coursera.org/learn/convolutional-neural-networks)

- I initially tried to use **Michael Ramos**’ implementation of style transfer and got inspired by his project for the swift portion of the code
>[https://hackernoon.com/diy-prisma-fast-style-transfer-app-with-coreml-and-tensorflow-817c3b90dacd](https://hackernoon.com/diy-prisma-fast-style-transfer-app-with-coreml-and-tensorflow-817c3b90dacd)
>[https://github.com/mdramos/fast-style-transfer-coreml](https://github.com/mdramos/fast-style-transfer-coreml)

- As the models in Michael Ramos’ implementation were too large for my device, I ended up going with the lighter mobile solution offered by **Fritz**, but another solution would have been to use quantization of the models for better portability
>[https://heartbeat.fritz.ai/real-time-style-transfer-for-ios-transform-your-photos-and-videos-into-masterpieces-f04111fcd2ff](https://heartbeat.fritz.ai/real-time-style-transfer-for-ios-transform-your-photos-and-videos-into-masterpieces-f04111fcd2ff)

- Fritz GitHub
>[https://github.com/fritzlabs/fritz-models](https://github.com/fritzlabs/fritz-models)  

- Other interesting Fast Style Transfer ressources
>[https://github.com/lengstrom/fast-style-transfer](https://github.com/lengstrom/fast-style-transfer)
>[https://arxiv.org/pdf/1603.08155.pdf](https://arxiv.org/pdf/1603.08155.pdf)

- Other interesting implementation by Reiichiro Nakano
>[https://magenta.tensorflow.org/blog/2018/12/20/style-transfer-js/](https://magenta.tensorflow.org/blog/2018/12/20/style-transfer-js/)

- Pretrained model resources
>[https://www.tensorflow.org/lite/guide/hosted_models](https://www.tensorflow.org/lite/guide/hosted_models)
>[http://www.vlfeat.org/matconvnet/pretrained/](http://www.vlfeat.org/matconvnet/pretrained/)

- Working with pre-trained ConvNets
>[https://www.tensorflow.org/tutorials/images/transfer_learning#create_the_base_model_from_the_pre-trained_convnets](https://www.tensorflow.org/tutorials/images/transfer_learning#create_the_base_model_from_the_pre-trained_convnets)

- Public datasets for image training
>[http://cocodataset.org/#download](http://cocodataset.org/#download)

- Working with cloud computing makes it easier to train your own models. Here is a good tutorial on how to setup your instances for Deep Learning on AWS:
>[https://www.datacamp.com/community/tutorials/deep-learning-jupyter-aws](https://www.datacamp.com/community/tutorials/deep-learning-jupyter-aws)
