"""SSD detection model.
"""

import cv2
import numpy as np
import caffe 

labels = ["background", "aeroplane", "bicycle", "bird", "boat", 
          "bottle", "bus", "car", "cat", "chair", 
          "cow", "diningtable", "dog", "horse", "motorbike", 
          "person", "pottedplant", "sheep",  "sofa", "train", "tvmonitor"]

class SSDdetector:
    def __init__(self, type, threshold=0.5):
        """Init.
        """
        self.type = type
        self.t = threshold

    def _create_ssd_detector(self):
        """Create ssd  classifier.

        # Returns
            ssd: ssd 300 * 300  classifier.
        """
        prototxt = 'data/ssd/deploy.prototxt'
        model = 'data/ssd/VGG_VOC0712Plus_SSD_300x300_ft_iter_160000.caffemodel'

        ssd = caffe.Net(prototxt, model, caffe.TEST)

        return ssd

    def _ssd_box(self, detections, h, w):
        """Resize the detection boxes of ssd.

        # Arguments
            detections: String, path to xml data.
            h: Integer, original height of image.
            w: Integer, original width of image.

        # Returns
            rects: detection boxes.
        """
        rects = []

        for i in range(0, detections.shape[2]):
            confidence = detections[0, 0, i, 2]
            index = int(detections[0, 0, i, 1])

            if confidence < self.t:
                continue

            if labels[index] == 'person':
                box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
                (x1, y1, x2, y2) = box.astype("int")
                rects.append((x1, y1, x2, y2))

        return rects

    def detect(self, image):
        """Detect face with haar cascade classifier.

        # Arguments
            image: ndarray(n, n, 3), video image.

        # Returns
            boxes: List, boxes rectangles in the image.
        """
        if self.type == 'CPU':
            caffe.set_mode_cpu()
            print("CPU mode")
        elif self.type == 'GPU':
            caffe.set_mode_gpu()
            print("GPU mode")
        else:
            raise 'You must select CPU or GPU type'

        pic = image.copy()
        h, w = pic.shape[:2]
        pic = caffe.io.load_image(cv2.resize(pic, (300, 300)), 1.0,
            (300, 300), (104.0, 177.0, 123.0))
        ssd = self._create_ssd_detector()
        ssd.blobs['data'].data[...] = pic
        detections = ssd.forward()
        boxes = self._ssd_box(detections, h, w)

        return boxes
