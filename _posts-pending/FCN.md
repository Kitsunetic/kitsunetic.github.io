# FCN(Fully Convolutional Network)

https://medium.com/@msmapark2/fcn-%EB%85%BC%EB%AC%B8-%EB%A6%AC%EB%B7%B0-fully-convolutional-networks-for-semantic-segmentation-81f016d76204

VGG나 Inception, Resnet과 같은 잘 알려진 CNN 기반의 모델들은 초기 설계 당시 classification에 이용하기 위해 CNN 구조 뒤에 Linear 모델을 붙이 구조를 가지고 있다.
하지만 Linear 구조는 CNN 출력을 flatten하여 입력받기 때문에 위치 정보가 사라진다는 단점이 있다.

Encoding/Decoding 개념으로, CNN을 통과하면서 feature map으로 encoding된 정보를 Semantic Segmentation 등에 이용하기 위해서 
