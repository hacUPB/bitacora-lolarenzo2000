# Reto

### ofApp.h
~~~ cpp
#pragma once

#include "ofMain.h"

class Sphere {
public:
	ofVec3f vector;
	float radius = 10;
	ofColor color;
};

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();

		void updateSpheres();

		void keyPressed(int key);
		void mousePressed(int x, int y, int button);

		void convertMouseToRay(int mouseX, int mouseY, glm::vec3 & rayStart, glm::vec3 & rayEnd);
		bool rayIntersectsSphere(const glm::vec3 & rayStart, const glm::vec3 & rayDir, const glm::vec3 & sphereCenter, float sphereRadius, glm::vec3 & intersectionPoint);

		ofEasyCam cam;
		vector<Sphere> spheres;
		bool sphereSelected;
		Sphere selected;

		int cuadricula;

		int xStep, yStep;
		int distDiv;
		int amplitud;
};
~~~
### ofApp.cpp
~~~ cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
	ofBackground(250);
	ofEnableDepthTest();

	xStep = 25;
	yStep = 25;
	distDiv = 50.0;
	amplitud = 100.0;
	cuadricula = 500;

	updateSpheres();
}

void ofApp::updateSpheres() {
	spheres.clear();
	for (int x = -cuadricula; x < cuadricula; x += xStep) {
		for (int y = -cuadricula; y < cuadricula; y += yStep) {
			float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud;
			Sphere s;
			s.vector.set(x, y, z);
			spheres.push_back(s);
		}
	}
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
	cam.begin();
	for (int i = 0; i < spheres.size(); i++) {
		if  (sphereSelected) {
			if (selected.vector == spheres[i].vector) {
				int r = ofMap(spheres[i].vector.x, cuadricula, -cuadricula, 0, 255);
				int g = ofMap(spheres[i].vector.z, cuadricula, -cuadricula, 0, 255);
				int b = ofMap(spheres[i].vector.y, cuadricula, -cuadricula, 0, 255);
				ofSetColor(r, g, b);
				ofDrawSphere(spheres[i].vector, spheres[i].radius+5);
			}
		}
		int r = ofMap(spheres[i].vector.x, -cuadricula, cuadricula, 0, 255);
		int g = ofMap(spheres[i].vector.z, -cuadricula, cuadricula, 0, 255);
		int b = ofMap(spheres[i].vector.y, -cuadricula, cuadricula, 0, 255);
		ofSetColor(r, g, b);
		ofDrawSphere(spheres[i].vector, spheres[i].radius);
	}
	cam.end();
	ofSetColor(0);
	ofDrawBitmapString("Frame Rate: " + ofToString(ofGetFrameRate()), 20, 20);
	ofDrawBitmapString("Steps: [+|-]" + ofToString(xStep), 20, 40);
	ofDrawBitmapString("Amplitud [Up|Down]: " + ofToString(amplitud), 20, 60);
	ofDrawBitmapString("Divisor [Left|Right]: " + ofToString(distDiv), 20, 80);
	if (sphereSelected) {
		ofDrawBitmapString("Esfera Seleccionada: " , 20, 100);
		ofDrawBitmapString("x" + ofToString(selected.vector.x), 20, 120);
		ofDrawBitmapString("y: " + ofToString(selected.vector.y), 20, 140);
		ofDrawBitmapString("z: " + ofToString(selected.vector.z), 20, 180);
	}
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
	switch (key) {
	case '-':
		yStep -= 1;
		xStep -= 1;
			break;
	case '+':
		yStep += 1;
		xStep += 1;		
			break;
	case OF_KEY_UP:
		amplitud += 10;
				
		break;
	case OF_KEY_DOWN:
		amplitud -= 10;
		break;
	case OF_KEY_RIGHT:
		if (distDiv > 10) {
			distDiv -= 10;
		}
		break;
	case OF_KEY_LEFT:
		distDiv += 10;
		break;
	}
	sphereSelected = false;
	updateSpheres();
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {
	// Convertir las coordenadas del mouse en un rayo 3D
	glm::vec3 rayStart, rayEnd;
	convertMouseToRay(x, y, rayStart, rayEnd);

	// Comprobar si el rayo intersecta alguna esfera
	sphereSelected = false;
	for (int i = 0; i < spheres.size();i++) {
		glm::vec3 intersectionPoint;
		if (rayIntersectsSphere(rayStart, rayEnd - rayStart, spheres[i].vector, 5.0, intersectionPoint)) {
			// EN ESTA PARTE Debes adicionar la lógica para indicarle
			// a la aplicación la esfera seleccionada.
			selected = spheres[i];
			sphereSelected = true;
		}
	}
}

void ofApp::convertMouseToRay(int mouseX, int mouseY, glm::vec3 & rayStart, glm::vec3 & rayEnd) {
	// Obtener matrices de proyección y modelo/vista de la cámara
	glm::mat4 modelview = cam.getModelViewMatrix();
	glm::mat4 projection = cam.getProjectionMatrix();
	ofRectangle viewport = ofGetCurrentViewport();

	// Convertir coordenadas del mouse a Normalized Device Coordinates (NDC)
	float x = 2.0f * (mouseX - viewport.x) / viewport.width - 1.0f;
	float y = 1.0f - 2.0f * (mouseY - viewport.y) / viewport.height;

	// Crear el rayo en NDC
	glm::vec4 rayStartNDC(x, y, -1.0f, 1.0f); // Near plane
	glm::vec4 rayEndNDC(x, y, 1.0f, 1.0f); // Far plane

	// Convertir a coordenadas mundiales
	glm::vec4 rayStartWorld = glm::inverse(projection * modelview) * rayStartNDC;
	glm::vec4 rayEndWorld = glm::inverse(projection * modelview) * rayEndNDC;

	rayStartWorld /= rayStartWorld.w;
	rayEndWorld /= rayEndWorld.w;

	rayStart = glm::vec3(rayStartWorld);
	rayEnd = glm::vec3(rayEndWorld);
}

// Detectar si el rayo intersecta una esfera
bool ofApp::rayIntersectsSphere(const glm::vec3 & rayStart, const glm::vec3 & rayDir, const glm::vec3 & sphereCenter, float sphereRadius, glm::vec3 & intersectionPoint) {
	glm::vec3 oc = rayStart - sphereCenter;

	float a = glm::dot(rayDir, rayDir);
	float b = 2.0f * glm::dot(oc, rayDir);
	float c = glm::dot(oc, oc) - sphereRadius * sphereRadius;

	float discriminant = b * b - 4 * a * c;

	if (discriminant < 0) {
		return false;
	} else {
		float t = (-b - sqrt(discriminant)) / (2.0f * a);
		intersectionPoint = rayStart + t * rayDir;
		return true;
	}
}

~~~
